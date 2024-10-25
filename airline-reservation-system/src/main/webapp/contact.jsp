<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }

        .contact-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .contact-header h1 {
            color: #2c3e50;
            font-size: 2.5em;
            margin-bottom: 15px;
        }

        .contact-header p {
            color: #666;
            font-size: 1.1em;
        }

        .contact-form {
            background: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: bold;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #3498db;
        }

        .form-group textarea {
            height: 150px;
            resize: vertical;
        }

        .submit-btn {
            background-color: #3498db;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #2980b9;
        }

        .contact-info {
            margin-top: 40px;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .info-item {
            text-align: center;
            flex: 1;
            min-width: 200px;
        }

        .info-item i {
            color: #3498db;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px auto;
                padding: 15px;
            }

            .contact-form {
                padding: 20px;
            }

            .info-item {
                flex: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="contact-header">
            <h1>Contact Us</h1>
            <p>We'd love to hear from you. Please fill out the form below and we'll get back to you as soon as possible.</p>
        </div>

        <form class="contact-form" action="processContact.jsp" method="POST" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="name">Full Name *</label>
                <input type="text" id="name" name="name" required>
                <div class="error-message" id="name-error">Please enter your name</div>
            </div>

            <div class="form-group">
                <label for="email">Email Address *</label>
                <input type="email" id="email" name="email" required>
                <div class="error-message" id="email-error">Please enter a valid email address</div>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone">
                <div class="error-message" id="phone-error">Please enter a valid phone number</div>
            </div>

            <div class="form-group">
                <label for="subject">Subject *</label>
                <input type="text" id="subject" name="subject" required>
                <div class="error-message" id="subject-error">Please enter a subject</div>
            </div>

            <div class="form-group">
                <label for="message">Message *</label>
                <textarea id="message" name="message" required></textarea>
                <div class="error-message" id="message-error">Please enter your message</div>
            </div>

            <button type="submit" class="submit-btn">Send Message</button>
        </form>

        <div class="contact-info">
            <div class="info-item">
                <i class="fas fa-map-marker-alt"></i>
                <h3>Address</h3>
                <p>123 Business Street<br>City, State 12345</p>
            </div>
            <div class="info-item">
                <i class="fas fa-phone"></i>
                <h3>Phone</h3>
                <p>+1 (555) 123-4567</p>
            </div>
            <div class="info-item">
                <i class="fas fa-envelope"></i>
                <h3>Email</h3>
                <p>contact@yourcompany.com</p>
            </div>
        </div>
    </div>

    <script>
        function validateForm() {
            let isValid = true;
            const fields = ['name', 'email', 'subject', 'message'];
            
            fields.forEach(field => {
                const element = document.getElementById(field);
                const errorElement = document.getElementById(`${field}-error`);
                
                if (!element.value.trim()) {
                    errorElement.style.display = 'block';
                    isValid = false;
                } else {
                    errorElement.style.display = 'none';
                }
            });

            // Email validation
            const email = document.getElementById('email');
            const emailError = document.getElementById('email-error');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email.value)) {
                emailError.style.display = 'block';
                isValid = false;
            }

            // Phone validation (if provided)
            const phone = document.getElementById('phone');
            const phoneError = document.getElementById('phone-error');
            if (phone.value && !/^\+?\d{10,}$/.test(phone.value.replace(/[\s-]/g, ''))) {
                phoneError.style.display = 'block';
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>
</html>