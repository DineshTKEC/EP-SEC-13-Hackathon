<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkyBooker - Flight Reservation System</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background-color: var(--primary-color);
            padding: 1rem 2rem;
        }

        .navbar-brand {
            color: white !important;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .container {
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

        .booking-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border: none;
        }

        .card-header {
            background: var(--primary-color);
            color: white;
            padding: 1.5rem;
            border-bottom: none;
        }

        .form-label {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 0.75rem;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }

        .trip-type-toggle {
            margin-bottom: 1.5rem;
        }

        .btn-book {
            background-color: var(--secondary-color);
            color: white;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-book:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        .flight-features {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 8px;
            margin-top: 1rem;
        }

        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .feature-item i {
            color: var(--secondary-color);
            margin-right: 0.5rem;
        }

        #loading {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.9);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .spinner {
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid var(--secondary-color);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="fas fa-plane-departure me-2"></i>SkyBooker</a>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card booking-card">
                    <div class="card-header">
                        <h2 class="text-center mb-0"><i class="fas fa-ticket-alt me-2"></i>Book Your Flight</h2>
                    </div>
                    <div class="card-body p-4">
                        <form id="bookTicketForm" action="processBooking.jsp" method="post">
                            <!-- Trip Type Selection -->
                            <div class="trip-type-toggle">
                                <div class="btn-group w-100" role="group">
                                    <input type="radio" class="btn-check" name="tripType" id="roundTrip" value="roundTrip" checked>
                                    <label class="btn btn-outline-primary" for="roundTrip">Round Trip</label>
                                    <input type="radio" class="btn-check" name="tripType" id="oneWay" value="oneWay">
                                    <label class="btn btn-outline-primary" for="oneWay">One Way</label>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Departure City -->
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="departure">
                                        <i class="fas fa-plane-departure me-2"></i>From
                                    </label>
                                    <select class="form-select" id="departure" name="departure" required>
                                        <option value="" disabled selected>Select departure city</option>
                                        <option value="New York">New York (JFK)</option>
                                        <option value="Los Angeles">Los Angeles (LAX)</option>
                                        <option value="Chicago">Chicago (ORD)</option>
                                        <option value="San Francisco">San Francisco (SFO)</option>
                                        <option value="Miami">Miami (MIA)</option>
                                    </select>
                                </div>

                                <!-- Destination City -->
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="destination">
                                        <i class="fas fa-plane-arrival me-2"></i>To
                                    </label>
                                    <select class="form-select" id="destination" name="destination" required>
                                        <option value="" disabled selected>Select destination city</option>
                                        <option value="London">London (LHR)</option>
                                        <option value="Paris">Paris (CDG)</option>
                                        <option value="Tokyo">Tokyo (HND)</option>
                                        <option value="Dubai">Dubai (DXB)</option>
                                        <option value="Singapore">Singapore (SIN)</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Departure Date -->
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="departureDate">
                                        <i class="fas fa-calendar-alt me-2"></i>Departure Date
                                    </label>
                                    <input type="date" class="form-control" id="departureDate" name="departureDate" required>
                                </div>

                                <!-- Return Date -->
                                <div class="col-md-6 mb-3" id="returnDateContainer">
                                    <label class="form-label" for="returnDate">
                                        <i class="fas fa-calendar-alt me-2"></i>Return Date
                                    </label>
                                    <input type="date" class="form-control" id="returnDate" name="returnDate">
                                </div>
                            </div>

                            <div class="row">
                                <!-- Number of Passengers -->
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="passengers">
                                        <i class="fas fa-users me-2"></i>Passengers
                                    </label>
                                    <input type="number" class="form-control" id="passengers" name="passengers" min="1" max="10" required>
                                </div>

                                <!-- Class Selection -->
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="class">
                                        <i class="fas fa-chair me-2"></i>Class
                                    </label>
                                    <select class="form-select" id="class" name="class" required>
                                        <option value="" disabled selected>Select class</option>
                                        <option value="Economy">Economy</option>
                                        <option value="Premium Economy">Premium Economy</option>
                                        <option value="Business">Business</option>
                                        <option value="First Class">First Class</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Features Section -->
                            <div class="flight-features mt-4">
                                <h5 class="mb-3">Included in Your Booking:</h5>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="feature-item">
                                            <i class="fas fa-suitcase"></i>
                                            <span>Free Baggage Allowance</span>
                                        </div>
                                        <div class="feature-item">
                                            <i class="fas fa-utensils"></i>
                                            <span>Complimentary Meals</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="feature-item">
                                            <i class="fas fa-exchange-alt"></i>
                                            <span>Free Date Change</span>
                                        </div>
                                        <div class="feature-item">
                                            <i class="fas fa-shield-alt"></i>
                                            <span>Travel Insurance</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="mt-4">
                                <button type="submit" class="btn btn-book w-100">
                                    <i class="fas fa-search me-2"></i>Search Flights
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Loading Spinner -->
    <div id="loading">
        <div class="spinner"></div>
    </div>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('bookTicketForm');
            const loading = document.getElementById('loading');
            const returnDateContainer = document.getElementById('returnDateContainer');
            const returnDate = document.getElementById('returnDate');
            const tripTypeInputs = document.querySelectorAll('input[name="tripType"]');
            const departureDate = document.getElementById('departureDate');

            // Set minimum date for departure
            const today = new Date();
            const tomorrow = new Date(today);
            tomorrow.setDate(tomorrow.getDate() + 1);
            departureDate.min = tomorrow.toISOString().split('T')[0];

            // Handle trip type changes
            tripTypeInputs.forEach(input => {
                input.addEventListener('change', function() {
                    if (this.value === 'oneWay') {
                        returnDateContainer.style.display = 'none';
                        returnDate.removeAttribute('required');
                    } else {
                        returnDateContainer.style.display = 'block';
                        returnDate.setAttribute('required', 'required');
                    }
                });
            });

            // Update return date minimum when departure date changes
            departureDate.addEventListener('change', function() {
                returnDate.min = this.value;
            });

            // Form submission
            form.addEventListener('submit', function(event) {
                event.preventDefault();

                // Validate destination != departure
                const departure = document.getElementById('departure').value;
                const destination = document.getElementById('destination').value;
                if (departure === destination) {
                    alert('Departure and destination cities cannot be the same.');
                    return;
                }

                // Show loading spinner
                loading.style.display = 'flex';

                // Simulate form submission delay
                setTimeout(function() {
                    form.submit();
                }, 2000);
            });
        });
    </script>
</body>
</html>