<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agricare</title>
    <link href="../css/style.css" rel="stylesheet">
    <script src="script.js" defer></script>
    <style>
        .logo-container {
            display: flex;
            align-items: center;
            padding: 0px;
        }

        .logo {
            height: 70px; /* Increased height */
            width: auto; /* Maintain aspect ratio */
        }

        .header-container {
            background-color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-sizing: border-box;
        }

        .contact-info {
            text-align: right;
        }

        .nav-container {
            background-color: #f0e68c;
            padding: 10px 20px;
            display: flex;
            justify-content: center; /* Center the navigation */
        }

        .banner {
            position: relative;
            text-align: left; /* Align text to the left */
            color: white;
            background-color: #f0e68c;
            padding: 0px 0;
        }

        .banner img {
            width: 100%;
            height: auto;
        }

        .banner-text {
            position: absolute;
            top: 40%; /* Adjust to desired vertical position */
            left: 5%; /* Adjust to desired horizontal position */
            transform: translate(0, -50%);
        }
        .banner-text a.join-button {
    display: inline-block;
    background-color: #32cd32;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    text-decoration: none; /* Remove underline from link */
    font-size: 1em;
}
        

        .banner-text h1 {
            font-size: 3em;
        }

        .banner-text p {
            font-size: 3em;
            font-weight: bold; /* Bold the text */
        }

        .banner-text button {
            background-color: #32cd32;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .features {
            width: 100%;
            display: flex;
            justify-content: space-around;
            padding: 45px;
            background-color: transparent;
        }

        .card {
            background-color: white;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            width: 400px;
        }

        .feature {
            background-color: white; /* Ensure the feature background is white */
            border-radius: 12px;
        }

        .feature img {
            width: 100%;
            height: auto;
            max-width: 300px;
        }

        .feature h3 {
            background-color: white; /* Change background color to white */
            color: green; /* Change font color to green */
            padding: 10px;
            margin: -20px -20px 20px;
            border-radius: 12px 12px 0 0;
            font-size: 25px;
        }

        .feature p {
            color: black;
            margin: 10px 0;
            upper-margin:5px 0;
        }

        /* Additional CSS for new sections */
        #about {
            margin-bottom: 10px;
            padding: 150px;
        }

        #about h2, #why-choose h2, #services h2 {
            text-align: center; /* Center the heading */
            font-size: 24px;
            margin-bottom: 10px;
        }

        #about h3, #services h3 {
            font-size: 20px;
            margin-bottom: 5px;
        }

        #about h4 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        #about p, #why-choose p, #services p {
            margin-bottom: 10px;
        }

        #about, #why-choose {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #about img, #why-choose img {
            width: 300px; /* Adjust the size as needed */
            height: auto;
        }

        #about .text-content, #why-choose .text-content {
            width: 60%;
        }

        #about .text-content {
            order: 2; /* Move text to the right */
        }

        #why-choose .text-content {
            order: 1; /* Move text to the left */
        }

        #why-choose img {
            order: 2; /* Move image to the right */
        }

        .service-card {
            display: inline-block;
            width: 30%;
            margin: 10px;
            text-align: center;
        }

        .service-card img {
            width: 100%;
            height: auto;
        }

        footer {
            background-color: #f8f8f8;
            padding: 20px;
            text-align: center;
        }

        footer img {
            width: 100px;
            margin-bottom: 10px;
        }

        footer ul {
            list-style: none;
            padding: 0;
        }

        footer ul li {
            display: inline;
            margin: 0 10px;
        }

        footer ul li a {
            text-decoration: none;
            color: #333;
        }

        footer .social-media {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo-container">
                <img src="../image/logo.png" alt="AgriCare Logo" class="logo">
            </div>
            <div class="contact-info">
                <p>Contact: 123-456-7890 | Email: info@agricare.com</p>
                <div class="social-media">
                    <!-- Social media icons -->
                </div>
            </div>
        </div>
        <div class="nav-container">
            <nav>
                <ul class="nav-links">
                    <li><a href="#">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#services">Services</a></li>
                    <li><a href="#contact">Contact Us</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <main>
        <div class="banner">
            <img src="../image/home.png" alt="Farmer working in a field">
           <div class="banner-text">
    <h1>WELCOME TO AGRICARE</h1>
    <p>Caring For Farmers, <br>Growing a Better Tomorrow</p>
    <a href="create-farmer.jsp" class="join-button">Join Us</a>
</div>

        </div>

        <!-- About AgriCare Section -->
        <section id="about">
            <img src="../image/introduction.png" alt="Farmer holding produce">
            <div class="text-content">
                <h2>Our Introduction</h2>
                <h3>About AgriCare</h3>
                <p>Empowering Farmers, Connecting Agriculture</p>
                <p>AgriCare aims to bridge the gap between farmers and technology, providing them with the tools and knowledge to improve their farming practices. Our platform offers a range of services, including crop marketplace, weather forecasts, and expert advice, to help farmers make informed decisions and increase their productivity.</p>
                <h4>Works</h4>
                <p>Farmers can list their products on our platform and connect with buyers. The platform also provides weather forecasts, expert advice, and other resources to help farmers improve their farming practices and increase their productivity.</p>
            </div>
        </section>

        <section class="features">
            <div class="card">
                <div class="feature">
                    <h3>Features</h3>
                    <p>We help farmers in farming.</p>
                    <img src="../image/farming-help.png" alt="Farmers working in a field">
                </div>
            </div>
            <div class="card">
                <div class="feature">
                    <h3>Features</h3>
                    <p>We provide expert advice.</p>
                    <img src="../image/expert-advice.png" alt="Experts giving advice">
                </div>
            </div>
        </section>

        <!-- Why Choose AgriCare Platform Section -->
        <section id="why-choose">
            <div class="text-content">
                <h2>Why Choose AgriCare Platform</h2>
                <p>Fresh Produce: Our platform ensures that farmers get the best prices for their produce by connecting them directly with buyers.</p>
                <p>Expert Advice: We provide farmers with access to expert advice to help them improve their farming practices.</p>
                <p>Weather Forecast: Our platform provides accurate weather forecasts to help farmers plan their activities and make informed decisions.</p>
            </div>
            <img src="../image/why-choose.png" alt="Farmer holding produce">
        </section>



        <!-- Our Services Section -->
        <section id="services">
            <h2>Our Services</h2>
            <div class="service-card">
                <img src="../image/crop-marketplace.png" alt="Crop Marketplace">
                <h3>Crop Marketplace</h3>
            </div>
            <div class="service-card">
                <img src="../image/weather-forcast.png" alt="Weather Forecast">
                <h3>Weather Forecast</h3>
            </div>
            <div class="service-card">
                <img src="../image/Expert.png" alt="Experts Advice">
                <h3>Experts Advice</h3>
            </div>
        </section>
    </main>
    
<footer id="contact">
    <img src="../image/logo.png" alt="AgriCare Logo">
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Services</a></li>
        <li><a href="#contact">Contact Us</a></li>
    </ul>
    <div class="social-media">
        <!-- Social media icons -->
    </div>
</footer>

</body>
</html>
