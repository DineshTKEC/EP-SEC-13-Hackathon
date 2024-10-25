<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkyBooker - Flight Search</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <style>
        /* Previous styles remain the same */
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

        .search-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border: none;
            margin-bottom: 2rem;
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

        .btn-search {
            background-color: var(--secondary-color);
            color: white;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-search:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        .flight-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
            transition: transform 0.3s ease;
            padding: 1.5rem;
        }

        .flight-card:hover {
            transform: translateY(-5px);
        }

        .flight-info {
            padding: 1.5rem;
        }

        .flight-time {
            font-size: 1.25rem;
            font-weight: bold;
            color: var(--primary-color);
        }

        .flight-duration {
            color: #666;
            font-size: 0.9rem;
        }

        .flight-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--accent-color);
        }

        .btn-book-flight {
            background-color: var(--secondary-color);
            color: white;
            border: none;
            border-radius: 5px;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
        }

        .btn-book-flight:hover {
            background-color: #2980b9;
        }

        .airline-logo {
            width: 40px;
            height: 40px;
            object-fit: contain;
        }

        .flight-details {
            position: relative;
        }

        .flight-path {
            position: relative;
            padding: 0 20px;
        }

        .flight-path::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            border-top: 2px dashed #ccc;
            z-index: 1;
        }

        .flight-path i {
            background: white;
            position: relative;
            z-index: 2;
            color: var(--secondary-color);
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
        <!-- Search Form -->
        <div class="search-card">
            <div class="card-header">
                <h2 class="text-center mb-0"><i class="fas fa-search me-2"></i>Search Flights</h2>
            </div>
            <div class="card-body p-4">
                <form id="searchFlightForm">
                    <div class="row">
                        <!-- Departure City -->
                        <div class="col-md-6 mb-3">
                            <label class="form-label" for="departure">
                                <i class="fas fa-plane-departure me-2"></i>From
                            </label>
                            <select class="form-select" id="departure" name="departure" required>
                                <option value="" disabled selected>Select departure city</option>
                                <option value="JFK">New York (JFK)</option>
                                <option value="LAX">Los Angeles (LAX)</option>
                                <option value="ORD">Chicago (ORD)</option>
                                <option value="SFO">San Francisco (SFO)</option>
                                <option value="MIA">Miami (MIA)</option>
                            </select>
                        </div>

                        <!-- Destination City -->
                        <div class="col-md-6 mb-3">
                            <label class="form-label" for="destination">
                                <i class="fas fa-plane-arrival me-2"></i>To
                            </label>
                            <select class="form-select" id="destination" name="destination" required>
                                <option value="" disabled selected>Select destination city</option>
                                <option value="LHR">London (LHR)</option>
                                <option value="CDG">Paris (CDG)</option>
                                <option value="HND">Tokyo (HND)</option>
                                <option value="DXB">Dubai (DXB)</option>
                                <option value="SIN">Singapore (SIN)</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Travel Date -->
                        <div class="col-md-6 mb-3">
                            <label class="form-label" for="travelDate">
                                <i class="fas fa-calendar-alt me-2"></i>Travel Date
                            </label>
                            <input type="date" class="form-control" id="travelDate" name="travelDate" required>
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
                                <option value="First">First Class</option>
                            </select>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="mt-4">
                        <button type="submit" class="btn btn-search w-100">
                            <i class="fas fa-search me-2"></i>Search Available Flights
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Flight Results Section -->
        <div id="flightResults"></div>
    </div>

    <!-- Loading Spinner -->
    <div id="loading">
        <div class="spinner"></div>
    </div>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('searchFlightForm');
            const loading = document.getElementById('loading');
            const flightResults = document.getElementById('flightResults');
            const travelDate = document.getElementById('travelDate');

            // Set minimum date
            const today = new Date();
            const tomorrow = new Date(today);
            tomorrow.setDate(tomorrow.getDate() + 1);
            travelDate.min = tomorrow.toISOString().split('T')[0];

            // Mock flight data generator
            function generateFlights(departure, destination, travelDate, className) {
                const airlines = [
                    { name: 'SkyWings Airlines', code: 'SW' },
                    { name: 'Global Airways', code: 'GA' },
                    { name: 'Ocean Air', code: 'OA' },
                    { name: 'Mountain Express', code: 'ME' }
                ];

                const flights = [];
                const basePrice = {
                    'Economy': 500,
                    'Premium Economy': 800,
                    'Business': 2000,
                    'First': 4000
                };

                // Generate 3-5 random flights
                const numFlights = Math.floor(Math.random() * 3) + 3;

                for (let i = 0; i < numFlights; i++) {
                    const airline = airlines[Math.floor(Math.random() * airlines.length)];
                    const baseHour = 6 + (i * 4); // Spread flights throughout the day
                    const departureTime = `${baseHour.toString().padStart(2, '0')}:${Math.floor(Math.random() * 60).toString().padStart(2, '0')}`;
                    
                    // Calculate arrival time (basic calculation for demo)
                    const durationHours = 5 + Math.floor(Math.random() * 4); // 5-8 hours flight
                    const arrivalHour = (baseHour + durationHours) % 24;
                    const arrivalTime = `${arrivalHour.toString().padStart(2, '0')}:${Math.floor(Math.random() * 60).toString().padStart(2, '0')}`;

                    const price = basePrice[className] + (Math.floor(Math.random() * 200) - 100);

                    flights.push({
                        airline: airline.name,
                        flightNumber: `${airline.code}${100 + Math.floor(Math.random() * 900)}`,
                        departureTime,
                        arrivalTime,
                        duration: `${durationHours}h ${Math.floor(Math.random() * 60)}m`,
                        price: price,
                        class: className
                    });
                }

                return flights;
            }

            // Form submission
            form.addEventListener('submit', function(event) {
                event.preventDefault();

                const departure = document.getElementById('departure').value;
                const destination = document.getElementById('destination').value;
                const selectedClass = document.getElementById('class').value;

                // Validate destination != departure
                if (departure === destination) {
                    alert('Departure and destination cities cannot be the same.');
                    return;
                }

                // Show loading spinner
                loading.style.display = 'flex';

                // Simulate API call delay
                setTimeout(() => {
                    const flights = generateFlights(departure, destination, travelDate.value, selectedClass);
                    displayFlights(flights, departure, destination);
                    loading.style.display = 'none';
                }, 1500);
            });

            // Display flights
            function displayFlights(flights, departure, destination) {
                const resultsHTML = `
                    <h3 class="mb-4">Available Flights</h3>
                    ${flights.map(flight => `
                        <div class="flight-card">
                            <div class="row align-items-center">
                                <div class="col-md-3">
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-plane me-3 text-primary" style="font-size: 24px;"></i>
                                        <div>
                                            <div class="fw-bold">${flight.airline}</div>
                                            <div class="text-muted">${flight.flightNumber}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="flight-details d-flex align-items-center justify-content-between">
                                        <div class="text-center">
                                            <div class="flight-time">${flight.departureTime}</div>
                                            <div class="text-muted">${departure}</div>
                                        </div>
                                        <div class="flight-path px-3">
                                            <i class="fas fa-plane"></i>
                                        </div>
                                        <div class="text-center">
                                            <div class="flight-time">${flight.arrivalTime}</div>
                                            <div class="text-muted">${destination}</div>
                                        </div>
                                    </div>
                                    <div class="text-center mt-2">
                                        <span class="flight-duration">${flight.duration}</span>
                                    </div>
                                    </div>
                                <div class="col-md-2">
                                    <div class="text-center">
                                        <div class="text-muted mb-1">Class</div>
                                        <div class="fw-bold">${flight.class}</div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="text-end">
                                        <div class="flight-price mb-2">$${flight.price}</div>
                                        <button class="btn btn-book-flight" onclick="bookFlight('${flight.flightNumber}')">
                                            <i class="fas fa-ticket-alt me-2"></i>Book Now
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `).join('')}
                `;

                flightResults.innerHTML = resultsHTML;
            }

            // Book flight function
            function bookFlight(flightNumber) {
                // Add booking logic here
                alert(`Booking flight ${flightNumber}. This feature will be implemented soon.`);
            }
        });

        // Additional utility functions
        function formatCurrency(amount) {
            return new Intl.NumberFormat('en-US', {
                style: 'currency',
                currency: 'USD'
            }).format(amount);
        }

        function formatDate(date) {
            return new Intl.DateTimeFormat('en-US', {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            }).format(new Date(date));
        }

        // Add form validation
        function validateForm() {
            const departure = document.getElementById('departure').value;
            const destination = document.getElementById('destination').value;
            const travelDate = document.getElementById('travelDate').value;
            const travelClass = document.getElementById('class').value;

            if (!departure || !destination || !travelDate || !travelClass) {
                alert('Please fill in all fields');
                return false;
            }

            if (departure === destination) {
                alert('Departure and destination cities cannot be the same');
                return false;
            }

            const selectedDate = new Date(travelDate);
            const today = new Date();
            if (selectedDate < today) {
                alert('Please select a future date');
                return false;
            }

            return true;
        }

        // Add sort functionality
        function sortFlights(flights, criteria) {
            switch(criteria) {
                case 'price':
                    return flights.sort((a, b) => a.price - b.price);
                case 'duration':
                    return flights.sort((a, b) => {
                        const durationA = parseInt(a.duration.split('h')[0]);
                        const durationB = parseInt(b.duration.split('h')[0]);
                        return durationA - durationB;
                    });
                case 'departure':
                    return flights.sort((a, b) => a.departureTime.localeCompare(b.departureTime));
                default:
                    return flights;
            }
        }

        // Add filter functionality
        function filterFlights(flights, filters) {
            return flights.filter(flight => {
                let matchesFilters = true;
                
                if (filters.maxPrice) {
                    matchesFilters = matchesFilters && flight.price <= filters.maxPrice;
                }
                
                if (filters.airline) {
                    matchesFilters = matchesFilters && flight.airline === filters.airline;
                }
                
                if (filters.departureTime) {
                    const hour = parseInt(flight.departureTime.split(':')[0]);
                    switch(filters.departureTime) {
                        case 'morning':
                            matchesFilters = matchesFilters && (hour >= 6 && hour < 12);
                            break;
                        case 'afternoon':
                            matchesFilters = matchesFilters && (hour >= 12 && hour < 18);
                            break;
                        case 'evening':
                            matchesFilters = matchesFilters && (hour >= 18 || hour < 6);
                            break;
                    }
                }
                
                return matchesFilters;
            });
        }

        // Error handling
        window.addEventListener('error', function(e) {
            console.error('An error occurred:', e.error);
            loading.style.display = 'none';
            alert('An error occurred while processing your request. Please try again.');
        });

        // Initialize tooltips and popovers if using Bootstrap
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });

        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl);
        });
    </script>
</body>
</html>