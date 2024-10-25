<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Airline Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #007bff;
            --primary-dark: #0056b3;
            --secondary-color: #6c757d;
            --background-color: #f8f9fa;
            --text-color: #333333;
            --white: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        header {
            background-color: var(--primary-color);
            color: var(--white);
            padding: 15px 30px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h2 {
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        header h2 i {
            font-size: 1.8rem;
        }

        nav {
            display: flex;
            gap: 5px;
        }

        nav a {
            color: var(--white);
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        nav a:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        nav a i {
            font-size: 1.1rem;
        }

        .main-content {
            margin-top: 80px;
            padding: 40px 20px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-banner {
            background: linear-gradient(rgba(0, 123, 255, 0.9), rgba(0, 86, 179, 0.9)),
                        url("/api/placeholder/1400/400") center/cover;
            color: var(--white);
            padding: 60px 20px;
            text-align: center;
            border-radius: 15px;
            margin-bottom: 40px;
        }

        .hero-banner h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .hero-banner p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.8;
        }

        .about-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }

        .about-card {
            background: var(--white);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .about-card:hover {
            transform: translateY(-5px);
        }

        .about-card i {
            font-size: 40px;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .about-card h3 {
            color: var(--text-color);
            margin-bottom: 15px;
            font-size: 1.3rem;
        }

        .about-card p {
            color: var(--secondary-color);
            line-height: 1.6;
        }

        .stats-section {
            background: var(--white);
            padding: 40px;
            border-radius: 15px;
            margin-bottom: 40px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            text-align: center;
        }

        .stat-item {
            padding: 20px;
        }

        .stat-number {
            font-size: 2.5rem;
            color: var(--primary-color);
            font-weight: bold;
            margin-bottom: 10px;
        }

        .team-section {
            margin-bottom: 40px;
        }

        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }

        .team-member {
            background: var(--white);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 20px;
            object-fit: cover;
        }

        .social-links {
            margin-top: 20px;
        }

        .social-links a {
            color: var(--primary-color);
            margin: 0 10px;
            font-size: 1.2rem;
            transition: color 0.3s ease;
        }

        .social-links a:hover {
            color: var(--primary-dark);
        }

        .section-title {
            text-align: center;
            margin-bottom: 40px;
        }

        .section-title h2 {
            font-size: 2rem;
            color: var(--text-color);
            margin-bottom: 15px;
        }

        .section-title p {
            color: var(--secondary-color);
            max-width: 600px;
            margin: 0 auto;
        }

        footer {
            background-color: var(--primary-color);
            color: var(--white);
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }

        @media (max-width: 768px) {
            header {
                flex-direction: column;
                padding: 10px;
            }

            nav {
                margin-top: 10px;
                flex-wrap: wrap;
                justify-content: center;
            }

            nav a {
                padding: 8px 15px;
                font-size: 0.9rem;
            }

            .hero-banner {
                padding: 40px 20px;
            }

            .hero-banner h1 {
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
        <h2><i class="fas fa-plane"></i> Airline Reservation System</h2>
        <nav>
            <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="passengerList.jsp"><i class="fas fa-users"></i> Passenger List</a>
            <a href="addPassenger.jsp"><i class="fas fa-user-plus"></i> Add Passenger</a>
            <a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a>
            <a href="contact.jsp"><i class="fas fa-envelope"></i> Contact</a>
            <a href="help.jsp"><i class="fas fa-question-circle"></i> Help</a>
        </nav>
    </header>

    <div class="main-content">
        <section class="hero-banner">
            <h1>About Us</h1>
            <p>Connecting the world through safe, comfortable, and reliable air travel since 2010.</p>
        </section>

        <section class="about-section">
            <div class="about-card">
                <i class="fas fa-history"></i>
                <h3>Our History</h3>
                <p>Founded in 2010, we've grown from a small regional airline to a global aviation leader, serving millions of passengers across hundreds of destinations worldwide.</p>
            </div>
            <div class="about-card">
                <i class="fas fa-bullseye"></i>
                <h3>Our Mission</h3>
                <p>To provide exceptional air travel experiences through innovation, safety, and customer-focused service while maintaining the highest standards of reliability and comfort.</p>
            </div>
            <div class="about-card">
                <i class="fas fa-star"></i>
                <h3>Our Values</h3>
                <p>Safety, integrity, excellence, innovation, and customer satisfaction form the cornerstone of our operations and guide every decision we make.</p>
            </div>
        </section>

        <section class="stats-section">
            <div class="section-title">
                <h2>Our Achievement Numbers</h2>
                <p>A glimpse of our success through numbers</p>
            </div>
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-number">150+</div>
                    <p>Destinations</p>
                </div>
                <div class="stat-item">
                    <div class="stat-number">2M+</div>
                    <p>Happy Passengers</p>
                </div>
                <div class="stat-item">
                    <div class="stat-number">50+</div>
                    <p>Aircraft Fleet</p>
                </div>
                <div class="stat-item">
                    <div class="stat-number">99.9%</div>
                    <p>On-Time Flights</p>
                </div>
            </div>
        </section>

        <section class="team-section">
            <div class="section-title">
                <h2>Our Leadership Team</h2>
                <p>Meet the people who make it all possible</p>
            </div>
            <div class="team-grid">
                <div class="team-member">
                    <img src="/api/placeholder/150/150" alt="CEO">
                    <h3>John Smith</h3>
                    <p>Chief Executive Officer</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="team-member">
                    <img src="/api/placeholder/150/150" alt="COO">
                    <h3>Sarah Johnson</h3>
                    <p>Chief Operations Officer</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="team-member">
                    <img src="/api/placeholder/150/150" alt="CTO">
                    <h3>Michael Chen</h3>
                    <p>Chief Technology Officer</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <footer>
        <p>&copy; 2024 Airline Reservation System. All rights reserved.</p>
    </footer>
</body>
</html>