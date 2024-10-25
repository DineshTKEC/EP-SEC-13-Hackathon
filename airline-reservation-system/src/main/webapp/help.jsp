<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support Center</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }

        .header {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 2rem 0;
            text-align: center;
        }

        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .search-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 1rem;
        }

        .search-box {
            width: 100%;
            padding: 1rem;
            font-size: 1.1rem;
            border: none;
            border-radius: 30px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .category {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

        .category:hover {
            transform: translateY(-5px);
        }

        .category h3 {
            color: #1e3c72;
            margin-bottom: 1rem;
        }

        .category ul {
            list-style: none;
        }

        .category li {
            margin-bottom: 0.5rem;
        }

        .category a {
            color: #666;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .category a:hover {
            color: #1e3c72;
        }

        .faq-section {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        .faq-item {
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }

        .faq-question {
            font-weight: 600;
            color: #1e3c72;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .faq-answer {
            margin-top: 1rem;
            display: none;
            color: #666;
        }

        .contact-section {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            text-align: center;
        }

        .contact-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 1.5rem;
        }

        .contact-option {
            padding: 1.5rem;
            border: 1px solid #eee;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .contact-option:hover {
            background-color: #f8f9fa;
        }

        .button {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background-color: #1e3c72;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #2a5298;
        }

        footer {
            background: #1e3c72;
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .header h1 {
                font-size: 2rem;
            }

            .container {
                padding: 0 0.5rem;
            }

            .category {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Help & Support Center</h1>
        <div class="search-container">
            <input type="text" class="search-box" placeholder="Search for help...">
        </div>
    </div>

    <div class="container">
        <div class="categories">
            <div class="category">
                <h3>Getting Started</h3>
                <ul>
                    <li><a href="#">Create an Account</a></li>
                    <li><a href="#">Login Issues</a></li>
                    <li><a href="#">Account Verification</a></li>
                    <li><a href="#">Password Reset</a></li>
                </ul>
            </div>

            <div class="category">
                <h3>Account & Security</h3>
                <ul>
                    <li><a href="#">Privacy Settings</a></li>
                    <li><a href="#">Two-Factor Authentication</a></li>
                    <li><a href="#">Account Recovery</a></li>
                    <li><a href="#">Security Tips</a></li>
                </ul>
            </div>

            <div class="category">
                <h3>Billing & Payments</h3>
                <ul>
                    <li><a href="#">Payment Methods</a></li>
                    <li><a href="#">Subscription Plans</a></li>
                    <li><a href="#">Billing Issues</a></li>
                    <li><a href="#">Refund Policy</a></li>
                </ul>
            </div>

            <div class="category">
                <h3>Technical Support</h3>
                <ul>
                    <li><a href="#">System Requirements</a></li>
                    <li><a href="#">Troubleshooting</a></li>
                    <li><a href="#">Known Issues</a></li>
                    <li><a href="#">Bug Reports</a></li>
                </ul>
            </div>
        </div>

        <div class="faq-section">
            <h2>Frequently Asked Questions</h2>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleAnswer(this)">
                    How do I reset my password?
                    <span class="toggle">+</span>
                </div>
                <div class="faq-answer">
                    To reset your password, click on the "Forgot Password" link on the login page. Enter your email address, and we'll send you instructions to reset your password. Make sure to check your spam folder if you don't receive the email.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question" onclick="toggleAnswer(this)">
                    How can I update my account information?
                    <span class="toggle">+</span>
                </div>
                <div class="faq-answer">
                    Log in to your account, go to Settings, and select Profile. Here you can update your personal information, email, and other account details. Don't forget to save your changes.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question" onclick="toggleAnswer(this)">
                    What should I do if my account is locked?
                    <span class="toggle">+</span>
                </div>
                <div class="faq-answer">
                    If your account is locked, wait 30 minutes before trying again. If the issue persists, contact our support team through the contact form or email support@example.com with details of the issue.
                </div>
            </div>
        </div>

        <div class="contact-section">
            <h2>Still Need Help?</h2>
            <p>Our support team is here to assist you 24/7</p>
            <div class="contact-options">
                <div class="contact-option">
                    <h3>Email Support</h3>
                    <p>Get help via email</p>
                    <a href="mailto:support@example.com" class="button">Send Email</a>
                </div>
                <div class="contact-option">
                    <h3>Live Chat</h3>
                    <p>Chat with our team</p>
                    <a href="#" class="button">Start Chat</a>
                </div>
                <div class="contact-option">
                    <h3>Phone Support</h3>
                    <p>Call us directly</p>
                    <a href="tel:1800123456" class="button">1-800-123-456</a>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Help & Support Center. All rights reserved.</p>
    </footer>

    <script>
        function toggleAnswer(element) {
            const answer = element.nextElementSibling;
            const toggle = element.querySelector('.toggle');
            
            if (answer.style.display === 'block') {
                answer.style.display = 'none';
                toggle.textContent = '+';
            } else {
                answer.style.display = 'block';
                toggle.textContent = '-';
            }
        }

        // Search functionality
        document.querySelector('.search-box').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const links = document.querySelectorAll('.category a');
            
            links.forEach(link => {
                const text = link.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    link.parentElement.style.display = 'block';
                } else {
                    link.parentElement.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>