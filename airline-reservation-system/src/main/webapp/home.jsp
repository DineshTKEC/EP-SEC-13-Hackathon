<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Professional airline reservation system for seamless travel booking and management">
    <title>Airline Reservation System - Your Gateway to the World</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #1a365d;
            --primary-dark: #0f172a;
            --secondary-color: #3182ce;
            --accent-color: #ed8936;
            --background-color: #f7fafc;
            --text-color: #2d3748;
            --white: #ffffff;
            --gray-light: #edf2f7;
            --gray-dark: #4a5568;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        header {
            background-color: var(--primary-color);
            color: var(--white);
            padding: 1rem;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow-lg);
        }

        .header-container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 1rem;
        }

        header h2 {
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        header h2 i {
            font-size: 1.8rem;
            color: var(--accent-color);
        }

        nav {
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }

        nav a {
            color: var(--white);
            text-decoration: none;
            padding: 0.75rem 1rem;
            border-radius: 0.375rem;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            font-size: 0.95rem;
        }

        nav a:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        nav a i {
            font-size: 1.1rem;
        }

        .main-content {
            margin-top: 5rem;
            padding: 2rem 1rem;
            max-width: 1400px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-section {
            background: linear-gradient(rgba(26, 54, 93, 0.9), rgba(49, 130, 206, 0.9)),
                        url("/api/placeholder/1400/600") center/cover;
            color: var(--white);
            padding: 4rem 2rem;
            text-align: center;
            border-radius: 1rem;
            margin-bottom: 3rem;
            box-shadow: var(--shadow-lg);
        }

        .hero-section h1 {
            font-size: 2.75rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
        }

        .hero-section p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto 2rem;
            line-height: 1.8;
            opacity: 0.9;
        }

        .button {
            display: inline-block;
            background-color: var(--accent-color);
            color: var(--white);
            padding: 0.875rem 2rem;
            border-radius: 0.5rem;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .button:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow);
            background-color: #dd6b20;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        .feature {
            background-color: var(--white);
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease;
            border: 1px solid var(--gray-light);
        }

        .feature:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .feature i {
            font-size: 2.5rem;
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
        }

        .feature h3 {
            color: var(--primary-color);
            margin-bottom: 1rem;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .feature p {
            color: var(--gray-dark);
            line-height: 1.75;
        }

        .stats-section {
            background-color: var(--white);
            padding: 3rem 2rem;
            margin: 3rem 0;
            border-radius: 1rem;
            box-shadow: var(--shadow);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            text-align: center;
        }

        .stat-item h4 {
            font-size: 2.5rem;
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
            font-weight: 700;
        }

        .stat-item p {
            color: var(--gray-dark);
            font-size: 1.1rem;
        }

        footer {
            background-color: var(--primary-color);
            color: var(--white);
            padding: 3rem 1rem;
            margin-top: 4rem;
        }

        .footer-content {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .footer-section h4 {
            color: var(--accent-color);
            margin-bottom: 1.5rem;
            font-size: 1.2rem;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 0.75rem;
        }

        .footer-section ul li a {
            color: var(--gray-light);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .footer-section ul li a:hover {
            color: var(--accent-color);
        }

        .copyright {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--gray-light);
        }

        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 1rem;
            }

            nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            nav a {
                padding: 0.5rem 0.75rem;
                font-size: 0.9rem;
            }

            .hero-section {
                padding: 3rem 1rem;
            }

            .hero-section h1 {
                font-size: 2rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <h2><i class="fas fa-plane"></i> Airline Reservation System</h2>
            <nav>
                <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
                <a href="passengerList.jsp"><i class="fas fa-users"></i> Passenger List</a>
                <a href="addPassenger.jsp"><i class="fas fa-user-plus"></i> Add Passenger</a>
                <a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a>
                <a href="contact.jsp"><i class="fas fa-envelope"></i> Contact</a>
                <a href="help.jsp"><i class="fas fa-question-circle"></i> Help</a>
                <a href="booktickets.jsp"><i class="fas fa-question-circle"></i> Book Tickets</a>
            </nav>
        </div>
    </header>

    <div class="main-content">
        <section class="hero-section">
            <h1>Welcome, <%= user %>!</h1>
            <p>Experience premium travel planning with our state-of-the-art reservation system. Discover seamless booking, intelligent itineraries, and exclusive benefits designed for the modern traveler.</p>
            <a href="logout.jsp" class="button">Sign Out</a>
        </section>

        <div class="stats-section">
            <div class="stats-grid">
                <div class="stat-item">
                    <h4>150+</h4>
                    <p>Destinations</p>
                </div>
                <div class="stat-item">
                    <h4>1M+</h4>
                    <p>Happy Travelers</p>
                </div>
                <div class="stat-item">
                    <h4>24/7</h4>
                    <p>Customer Support</p>
                </div>
                <div class="stat-item">
                    <h4>98%</h4>
                    <p>Satisfaction Rate</p>
                </div>
            </div>
        </div>

        <div class="features">
            <div class="feature">
                <i class="fas fa-plane-departure"></i>
                <h3>Book Flights</h3>
                <p>Access our comprehensive flight network with competitive rates and flexible booking options. Compare prices and find the perfect flight for your journey.</p>
            </div>
            <div class="feature">
                <i class="fas fa-user-friends"></i>
                <h3>Manage Passengers</h3>
                <p>Effortlessly manage passenger profiles, store travel preferences, and streamline the booking process for future flights.</p>
            </div>
            <div class="feature">
                <i class="fas fa-ticket-alt"></i>
                <h3>e-Ticketing</h3>
                <p>Get instant access to your e-tickets with secure digital delivery. Download, print, or display your mobile ticket for hassle-free check-in.</p>
            </div>
            <div class="feature">
                <i class="fas fa-shield-alt"></i>
                <h3>Secure Booking</h3>
                <p>Rest assured with our enterprise-grade security measures protecting your personal and payment information at every step.</p>
            </div>
            <div class="feature">
                <i class="fas fa-globe"></i>
                <h3>Global Coverage</h3>
                <p>Connect to destinations worldwide through our extensive network of partner airlines and premium routes.</p>
            </div>
            <div class="feature">
                <i class="fas fa-percentage"></i>
                <h3>Exclusive Offers</h3>
                <p>Enjoy member-only discounts, seasonal promotions, and special rates on flights and travel packages.</p>
            </div>
        </div>
    </div>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h4>Company</h4>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Press Center</a></li>
                    <li><a href="#">Partner With Us</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Travel Resources</h4>
                <ul>
                    <li><a href="#">Flight Status</a></li>
                    <li><a href="#">Travel Insurance</a></li>
                    <li><a href="#">Travel Guidelines</a></li>
                    <li><a href="#">Baggage Information</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Support</h4>
                <ul>
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQs</a></li>
                    <li><a href="#">Feedback</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Legal</h4>
                <ul>
                    <li><a href="#">Terms & Conditions</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Cookie Policy</a></li>
                    <li><a href="#">Accessibility</a></li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2024 Airline Reservation System. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>