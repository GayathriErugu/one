I've created a fresh e-commerce platform UI for you. It's a complete, user-friendly shop page with a modern look and interactive features.
```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Lunar Mart · friendly e‑commerce</title>
  <!-- Fonts & Icons -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" />
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Inter', -apple-system, system-ui, sans-serif;
      background: #f6f5f2;
      color: #1e1e2a;
      line-height: 1.5;
      -webkit-font-smoothing: antialiased;
    }
    a { text-decoration: none; color: inherit; }
    img { display: block; max-width: 100%; }
    button { cursor: pointer; font: inherit; border: none; background: none; color: inherit; }
    input { font: inherit; }

    :root {
      --bg: #f6f5f2;
      --card: #ffffff;
      --primary: #1e1e2a;
      --primary-light: #2d2d44;
      --accent: #d46a5a;
      --accent-light: #f2d4ce;
      --accent-dark: #b85444;
      --muted: #5f5f72;
      --muted-light: #a3a3b5;
      --surface: #ecebe7;
      --success: #2b8c7a;
      --warning: #e5b85a;
      --radius: 20px;
      --radius-sm: 10px;
      --shadow: 0 8px 30px rgba(0,0,0,0.04);
      --shadow-hover: 0 18px 50px rgba(0,0,0,0.08);
      --transition: 0.2s ease;
      --container: 1280px;
    }

    .container { max-width: var(--container); margin: 0 auto; padding: 0 24px; }
    .muted { color: var(--muted); }
    .sr-only { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0,0,0,0); border: 0; }

    /* buttons */
    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 8px;
      padding: 12px 28px; border-radius: 999px; font-weight: 600; font-size: 15px;
      transition: var(--transition); border: 2px solid transparent;
    }
    .btn-primary { background: var(--accent); color: #fff; border-color: var(--accent); }
    .btn-primary:hover { background: var(--accent-dark); border-color: var(--accent-dark); transform: translateY(-2px); box-shadow: 0 8px 24px rgba(212,106,90,0.25); }
    .btn-secondary { background: var(--primary); color: #fff; border-color: var(--primary); }
    .btn-secondary:hover { background: var(--primary-light); transform: translateY(-2px); box-shadow: 0 8px 24px rgba(30,30,42,0.15); }
    .btn-outline { background: transparent; color: var(--primary); border-color: rgba(30,30,42,0.12); }
    .btn-outline:hover { background: var(--primary); color: #fff; border-color: var(--primary); transform: translateY(-2px); }
    .btn-ghost { background: rgba(255,255,255,0.10); color: #fff; border-color: rgba(255,255,255,0.15); }
    .btn-ghost:hover { background: rgba(255,255,255,0.20); border-color: rgba(255,255,255,0.30); transform: translateY(-2px); }
    .btn-sm { padding: 8px 18px; font-size: 13px; }

    /* header */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(255,255,255,0.88);
      backdrop-filter: blur(14px);
      -webkit-backdrop-filter: blur(14px);
      border-bottom: 1px solid rgba(30,30,42,0.04);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between; gap: 16px;
      padding: 10px 0; min-height: 66px;
    }
    .brand {
      display: flex; align-items: center; gap: 10px;
      font-weight: 800; font-size: 24px; letter-spacing: -0.4px;
    }
    .brand .accent { color: var(--accent); }
    .brand i { font-size: 26px; color: var(--accent); }

    nav.main-nav ul {
      display: flex; gap: 4px; list-style: none; align-items: center;
    }
    nav.main-nav li a {
      display: flex; align-items: center; gap: 6px;
      padding: 8px 18px; border-radius: var(--radius-sm);
      font-weight: 500; font-size: 14px; color: var(--muted);
      transition: var(--transition);
    }
    nav.main-nav li a:hover, nav.main-nav li a.active {
      background: var(--surface); color: var(--primary);
    }

    .header-actions {
      display: flex; align-items: center; gap: 4px;
    }
    .header-actions .icon-btn {
      width: 42px; height: 42px; display: grid; place-items: center;
      border-radius: 50%; font-size: 18px; color: var(--muted);
      transition: var(--transition);
    }
    .header-actions .icon-btn:hover { background: var(--surface); color: var(--primary); }

    .cart-wrap { position: relative; }
    .cart-count {
      position: absolute; top: -2px; right: -2px;
      background: var(--accent); color: #fff; font-size: 11px; font-weight: 700;
      width: 20px; height: 20px; border-radius: 50%; display: grid; place-items: center;
      border: 2px solid #fff;
    }

    .search-wrap {
      display: flex; align-items: center; background: var(--surface);
      border-radius: 999px; padding: 0 16px 0 20px;
      transition: var(--transition); border: 2px solid transparent;
      min-width: 200px;
    }
    .search-wrap:focus-within {
      border-color: var(--accent); background: #fff;
      box-shadow: 0 0 0 4px rgba(212,106,90,0.08);
    }
    .search-wrap input {
      border: 0; background: transparent; outline: none; width: 100%;
      padding: 10px 0; font-size: 14px; color: var(--primary);
    }
    .search-wrap input::placeholder { color: var(--muted-light); }
    .search-wrap button { padding: 8px 0 8px 10px; color: var(--muted); font-size: 15px; transition: var(--transition); }
    .search-wrap button:hover { color: var(--accent); }

    .mobile-toggle {
      display: none; width: 42px; height: 42px; border-radius: 50%;
      font-size: 20px; background: var(--surface); color: var(--primary);
    }
    .mobile-toggle:hover { background: var(--accent-light); }
    #mobileMenu {
      display: none; background: #fff; border-top: 1px solid rgba(30,30,42,0.04);
      padding: 12px 0 20px;
    }
    #mobileMenu ul { list-style: none; display: flex; flex-direction: column; gap: 4px; }
    #mobileMenu ul li a {
      display: flex; align-items: center; gap: 12px; padding: 12px 16px;
      border-radius: var(--radius-sm); font-weight: 500; color: var(--primary);
      transition: var(--transition);
    }
    #mobileMenu ul li a:hover { background: var(--surface); }
    #mobileMenu ul li a i { width: 22px; color: var(--muted); }

    /* hero */
    .hero {
      position: relative; display: flex; align-items: center;
      min-height: 420px; padding: 56px 0;
      border-radius: var(--radius); overflow: hidden;
      margin: 20px 24px 0;
      background: linear-gradient(130deg, #1e1e2e 0%, #2d2d44 100%);
    }
    .hero::before {
      content: ''; position: absolute; inset: 0;
      background: url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover no-repeat;
      opacity: 0.28; z-index: 0;
    }
    .hero .container { position: relative; z-index: 1; }
    .hero .badge {
      display: inline-block; background: rgba(212,106,90,0.18);
      color: var(--accent); padding: 4px 16px; border-radius: 999px;
      font-weight: 600; font-size: 13px; letter-spacing: 0.3px;
      margin-bottom: 16px;
    }
    .hero h1 {
      font-weight: 800; font-size: 44px; color: #fff;
      line-height: 1.1; max-width: 600px; margin-bottom: 16px;
    }
    .hero p {
      color: rgba(255,255,255,0.78); font-size: 17px;
      max-width: 480px; margin-bottom: 28px; line-height: 1.6;
    }
    .hero .actions { display: flex; gap: 12px; flex-wrap: wrap; }

    /* sections */
    .section { padding: 48px 0; }
    .section-header {
      display: flex; align-items: flex-end; justify-content: space-between;
      gap: 16px; margin-bottom: 28px; flex-wrap: wrap;
    }
    .section-header .title-group h2 {
      font-size: 28px; font-weight: 700; letter-spacing: -0.3px;
    }
    .section-header .title-group p { color: var(--muted); margin-top: 4px; font-size: 15px; }
    .section-header .view-all {
      font-weight: 600; color: var(--accent);
      display: flex; align-items: center; gap: 6px;
      font-size: 14px; transition: var(--transition); white-space: nowrap;
    }
    .section-header .view-all:hover { gap: 12px; color: var(--accent-dark); }

    /* categories */
    .categories-grid {
      display: grid; grid-template-columns: repeat(6,1fr); gap: 16px;
    }
    .cat-card {
      background: var(--card); border-radius: var(--radius);
      padding: 24px 12px; text-align: center; box-shadow: var(--shadow);
      transition: var(--transition); cursor: pointer;
      border: 2px solid transparent;
    }
    .cat-card:hover {
      transform: translateY(-6px); box-shadow: var(--shadow-hover);
      border-color: var(--accent-light);
    }
    .cat-card .icon-wrap {
      width: 56px; height: 56px; border-radius: 50%;
      background: var(--accent-light); display: grid; place-items: center;
      margin: 0 auto 12px; font-size: 24px; color: var(--accent);
      transition: var(--transition);
    }
    .cat-card:hover .icon-wrap { background: var(--accent); color: #fff; }
    .cat-card h4 { font-size: 15px; font-weight: 600; }
    .cat-card .count { font-size: 13px; color: var(--muted); margin-top: 4px; }

    /* products */
    .products-grid {
      display: grid; grid-template-columns: repeat(4,1fr); gap: 20px;
    }
    .product-card {
      background: var(--card); border-radius: var(--radius);
      overflow: hidden; box-shadow: var(--shadow);
      transition: var(--transition); display: flex; flex-direction: column;
      border: 2px solid transparent;
    }
    .product-card:hover {
      transform: translateY(-6px); box-shadow: var(--shadow-hover);
      border-color: var(--accent-light);
    }
    .product-card .img-wrap {
      position: relative; overflow: hidden; background: var(--surface);
      aspect-ratio: 1/1;
    }
    .product-card .img-wrap img {
      width: 100%; height: 100%; object-fit: cover;
      transition: var(--transition);
    }
    .product-card:hover .img-wrap img { transform: scale(1.04); }
    .product-card .badge {
      position: absolute; top: 12px; left: 12px;
      background: var(--accent); color: #fff; padding: 4px 12px;
      border-radius: 999px; font-size: 11px; font-weight: 700;
    }
    .product-card .badge.sale { background: var(--warning); color: var(--primary); }
    .product-card .wish-btn {
      position: absolute; top: 12px; right: 12px;
      width: 36px; height: 36px; border-radius: 50%;
      background: rgba(255,255,255,0.92); display: grid; place-items: center;
      font-size: 16px; color: var(--muted); transition: var(--transition);
      backdrop-filter: blur(4px);
    }
    .product-card .wish-btn:hover { background: #fff; color: var(--accent); transform: scale(1.10); }
    .product-card .body {
      padding: 16px 18px 10px; flex: 1; display: flex; flex-direction: column; gap: 4px;
    }
    .product-card .body .category-tag {
      font-size: 12px; color: var(--muted-light); text-transform: uppercase;
      letter-spacing: 0.5px; font-weight: 600;
    }
    .product-card .body h5 {
      font-size: 15px; font-weight: 600; line-height: 1.3;
      display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
    }
    .product-card .body .price-row {
      display: flex; align-items: center; gap: 10px; margin-top: 4px;
    }
    .product-card .body .price { font-weight: 700; font-size: 18px; color: var(--primary); }
    .product-card .body .old-price { color: var(--muted-light); text-decoration: line-through; font-size: 14px; }
    .product-card .body .rating {
      display: flex; align-items: center; gap: 4px; font-size: 13px; color: #e5b85a;
    }
    .product-card .body .rating span { color: var(--muted); font-weight: 400; }
    .product-card .footer {
      padding: 0 18px 18px; display: flex; gap: 10px;
    }
    .product-card .footer .add-btn {
      flex: 1; padding: 10px; border-radius: var(--radius-sm);
      background: var(--primary); color: #fff; font-weight: 600; font-size: 14px;
      transition: var(--transition); display: flex; align-items: center; justify-content: center; gap: 8px;
    }
    .product-card .footer .add-btn:hover { background: var(--accent); transform: scale(1.02); }
    .product-card .footer .add-btn.added { background: var(--success); }

    /* deal */
    .deal-wrap {
      display: flex; gap: 0; background: var(--card);
      border-radius: var(--radius); overflow: hidden; box-shadow: var(--shadow);
    }
    .deal-wrap .deal-img { flex: 0 0 48%; background: var(--surface); min-height: 260px; }
    .deal-wrap .deal-img img { width: 100%; height: 100%; object-fit: cover; }
    .deal-wrap .deal-content {
      flex: 1; padding: 36px 44px; display: flex; flex-direction: column;
      justify-content: center;
    }
    .deal-wrap .deal-content .tag {
      display: inline-block; background: var(--warning); color: var(--primary);
      padding: 4px 14px; border-radius: 999px; font-size: 12px; font-weight: 700;
      text-transform: uppercase; letter-spacing: 0.5px; align-self: flex-start;
      margin-bottom: 12px;
    }
    .deal-wrap .deal-content h3 { font-size: 28px; font-weight: 700; margin-bottom: 6px; }
    .deal-wrap .deal-content .desc { color: var(--muted); margin-bottom: 16px; }
    .deal-wrap .deal-content .price-big {
      font-size: 32px; font-weight: 800; color: var(--primary);
    }
    .deal-wrap .deal-content .price-big .old {
      font-size: 20px; font-weight: 400; color: var(--muted-light);
      text-decoration: line-through; margin-left: 10px;
    }
    .deal-wrap .deal-content .stock {
      font-size: 14px; color: var(--muted); margin: 4px 0 16px;
    }
    .deal-wrap .deal-content .stock strong { color: var(--accent); }
    .timer-grid {
      display: flex; gap: 12px; margin: 16px 0 20px;
    }
    .timer-box {
      background: var(--primary); color: #fff; padding: 10px 16px;
      border-radius: var(--radius-sm); min-width: 68px; text-align: center;
    }
    .timer-box .num { font-size: 26px; font-weight: 700; line-height: 1.2; }
    .timer-box .label { font-size: 11px; opacity: 0.70; text-transform: uppercase; letter-spacing: 0.5px; }

    /* testimonials */
    .testimonials-scroll {
      display: flex; gap: 20px; overflow-x: auto;
      padding: 8px 4px 16px; scroll-snap-type: x mandatory;
      -webkit-overflow-scrolling: touch;
    }
    .testimonials-scroll::-webkit-scrollbar { height: 4px; }
    .testimonials-scroll::-webkit-scrollbar-thumb { background: var(--accent-light); border-radius: 999px; }
    .testimonial-card {
      flex: 0 0 340px; background: var(--card); border-radius: var(--radius);
      padding: 24px 26px; box-shadow: var(--shadow); scroll-snap-align: start;
      transition: var(--transition);
    }
    .testimonial-card:hover { box-shadow: var(--shadow-hover); }
    .testimonial-card .stars { color: #e5b85a; font-size: 16px; letter-spacing: 2px; margin-bottom: 10px; }
    .testimonial-card blockquote {
      font-size: 15px; line-height: 1.6; color: var(--primary);
      margin-bottom: 14px; font-style: italic;
    }
    .testimonial-card .author {
      display: flex; align-items: center; gap: 12px;
    }
    .testimonial-card .author .avatar {
      width: 44px; height: 44px; border-radius: 50%; object-fit: cover;
      background: var(--surface);
    }
    .testimonial-card .author .name { font-weight: 600; font-size: 14px; }
    .testimonial-card .author .role { font-size: 13px; color: var(--muted); }

    /* newsletter */
    .newsletter-wrap {
      background: linear-gradient(130deg, var(--primary) 0%, var(--primary-light) 100%);
      border-radius: var(--radius); padding: 44px 52px;
      color: #fff; display: flex; align-items: center;
      justify-content: space-between; gap: 32px; flex-wrap: wrap;
    }
    .newsletter-wrap .text h3 { font-size: 26px; font-weight: 700; margin-bottom: 4px; }
    .newsletter-wrap .text p { opacity: 0.75; font-size: 15px; }
    .newsletter-wrap form {
      display: flex; gap: 10px; flex-wrap: wrap; flex: 1; max-width: 480px;
    }
    .newsletter-wrap form input {
      flex: 1; min-width: 200px; padding: 14px 20px; border-radius: 999px;
      border: 0; font-size: 15px; background: rgba(255,255,255,0.10);
      color: #fff; transition: var(--transition); outline: 2px solid transparent;
    }
    .newsletter-wrap form input::placeholder { color: rgba(255,255,255,0.5); }
    .newsletter-wrap form input:focus {
      outline-color: var(--accent); background: rgba(255,255,255,0.18);
    }
    .newsletter-wrap form .btn {
      background: var(--accent); color: #fff; border-color: var(--accent);
      padding: 14px 32px;
    }
    .newsletter-wrap form .btn:hover { background: var(--accent-dark); border-color: var(--accent-dark); }
    #newsletterMsg { margin-top: 12px; font-size: 14px; opacity: 0.9; width: 100%; }

    /* footer */
    footer {
      margin-top: 16px; padding: 40px 0 24px;
      border-top: 1px solid rgba(30,30,42,0.04);
    }
    .footer-grid {
      display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px; margin-bottom: 28px;
    }
    .footer-grid .brand-col .brand { font-size: 20px; margin-bottom: 8px; }
    .footer-grid .brand-col p { color: var(--muted); font-size: 14px; max-width: 300px; line-height: 1.6; }
    .footer-grid .brand-col .socials {
      display: flex; gap: 10px; margin-top: 14px;
    }
    .footer-grid .brand-col .socials a {
      width: 40px; height: 40px; border-radius: 50%;
      background: var(--surface); display: grid; place-items: center;
      color: var(--muted); transition: var(--transition); font-size: 16px;
    }
    .footer-grid .brand-col .socials a:hover { background: var(--accent); color: #fff; }
    .footer-grid .col h5 { font-weight: 700; font-size: 14px; margin-bottom: 12px; color: var(--primary); }
    .footer-grid .col ul { list-style: none; display: flex; flex-direction: column; gap: 6px; }
    .footer-grid .col ul li a { color: var(--muted); font-size: 14px; transition: var(--transition); }
    .footer-grid .col ul li a:hover { color: var(--accent); }
    .footer-bottom {
      text-align: center; padding-top: 20px;
      border-top: 1px solid rgba(30,30,42,0.04);
      color: var(--muted-light); font-size: 13px;
    }

    /* responsive */
    @media (max-width: 1200px) {
      .products-grid { grid-template-columns: repeat(3,1fr); }
      .categories-grid { grid-template-columns: repeat(3,1fr); }
      .footer-grid { grid-template-columns: 1fr 1fr; gap: 28px; }
    }
    @media (max-width: 992px) {
      .hero h1 { font-size: 36px; }
      .hero { min-height: 340px; margin: 16px 16px 0; padding: 36px 0; }
      .deal-wrap { flex-direction: column; }
      .deal-wrap .deal-img { flex: 0 0 200px; }
      .deal-wrap .deal-content { padding: 28px 30px; }
      .newsletter-wrap { padding: 32px 28px; flex-direction: column; text-align: center; }
      .newsletter-wrap form { max-width: 100%; }
      .search-wrap { min-width: 140px; }
    }
    @media (max-width: 768px) {
      nav.main-nav { display: none; }
      .mobile-toggle { display: grid; place-items: center; }
      .products-grid { grid-template-columns: repeat(2,1fr); gap: 14px; }
      .categories-grid { grid-template-columns: repeat(2,1fr); gap: 12px; }
      .hero h1 { font-size: 28px; }
      .hero p { font-size: 15px; }
      .section-header h2 { font-size: 22px; }
      .deal-wrap .deal-content h3 { font-size: 22px; }
      .deal-wrap .deal-content .price-big { font-size: 26px; }
      .timer-box { min-width: 56px; padding: 8px 12px; }
      .timer-box .num { font-size: 20px; }
      .footer-grid { grid-template-columns: 1fr; gap: 20px; }
      .brand { font-size: 18px; }
      .brand i { font-size: 20px; }
      .search-wrap { min-width: 110px; padding: 0 10px 0 14px; }
      .search-wrap input { font-size: 13px; padding: 8px 0; }
      .header-actions .icon-btn { width: 36px; height: 36px; font-size: 15px; }
      .cart-count { width: 18px; height: 18px; font-size: 10px; }
      .testimonial-card { flex: 0 0 280px; }
      .hero .actions .btn { padding: 10px 20px; font-size: 14px; }
      .section { padding: 32px 0; }
    }
    @media (max-width: 480px) {
      .products-grid { grid-template-columns: 1fr 1fr; gap: 10px; }
      .categories-grid { grid-template-columns: 1fr 1fr; gap: 10px; }
      .hero { margin: 10px 10px 0; min-height: 260px; padding: 24px 0; border-radius: var(--radius-sm); }
      .hero h1 { font-size: 24px; }
      .container { padding: 0 14px; }
      .deal-wrap .deal-content { padding: 20px 18px; }
      .deal-wrap .deal-img { flex: 0 0 140px; }
      .newsletter-wrap { padding: 24px 18px; }
      .newsletter-wrap .text h3 { font-size: 20px; }
      .product-card .body { padding: 12px 12px 6px; }
      .product-card .body h5 { font-size: 13px; }
      .product-card .body .price { font-size: 15px; }
      .product-card .footer { padding: 0 12px 12px; }
      .product-card .footer .add-btn { font-size: 12px; padding: 8px; }
      .timer-box { min-width: 46px; padding: 6px 8px; }
      .timer-box .num { font-size: 16px; }
      .timer-box .label { font-size: 9px; }
      .cat-card { padding: 16px 10px; }
      .cat-card .icon-wrap { width: 44px; height: 44px; font-size: 18px; }
      .cat-card h4 { font-size: 13px; }
    }
  </style>
</head>
<body>

<header>
  <div class="container header-inner">
    <div style="display:flex;align-items:center;gap:12px;">
      <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu"><i class="fas fa-bars"></i></button>
      <a class="brand" href="#"><i class="fas fa-moon"></i><span>Lunar<span class="accent">Mart</span></span></a>
    </div>
    <nav class="main-nav">
      <ul>
        <li><a href="#" class="active"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="#categories"><i class="fas fa-th-large"></i> Shop</a></li>
        <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a href="#deals"><i class="fas fa-tag"></i> Offers</a></li>
        <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
      </ul>
    </nav>
    <div style="display:flex;align-items:center;gap:10px;">
      <div class="search-wrap">
        <input type="search" id="searchInput" placeholder="Find products..." aria-label="Search" />
        <button id="searchBtn"><i class="fas fa-search"></i></button>
      </div>
      <div class="header-actions">
        <button class="icon-btn" title="Account"><i class="far fa-user"></i></button>
        <button class="icon-btn" title="Wishlist"><i class="far fa-heart"></i></button>
        <div class="cart-wrap">
          <button class="icon-btn" id="cartBtn"><i class="fas fa-shopping-bag"></i></button>
          <span class="cart-count" id="cartCount">0</span>
        </div>
      </div>
    </div>
  </div>
  <div id="mobileMenu">
    <div class="container">
      <ul>
        <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
        <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
        <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
        <li><a href="#"><i class="far fa-user"></i> Account</a></li>
        <li><a href="#"><i class="far fa-heart"></i> Wishlist</a></li>
      </ul>
    </div>
  </div>
</header>

<main>
  <!-- HERO -->
  <section class="hero">
    <div class="container">
      <div class="badge"><i class="fas fa-sparkles"></i> Spring drop 2026</div>
      <h1>Elevate your everyday</h1>
      <p>Curated style, tech & home — with free shipping & easy returns.</p>
      <div class="actions">
        <button class="btn btn-primary" id="shopNow"><i class="fas fa-arrow-right"></i> Explore</button>
        <button class="btn btn-ghost" id="exploreDeals"><i class="fas fa-clock"></i> Flash deals</button>
      </div>
    </div>
  </section>

  <!-- CATEGORIES -->
  <section class="section" id="categories">
    <div class="container">
      <div class="section-header">
        <div class="title-group"><h2>Shop by category</h2><p>Find exactly what you need</p></div>
        <a href="#" class="view-all">All <i class="fas fa-arrow-right"></i></a>
      </div>
      <div class="categories-grid" id="categoriesGrid"></div>
    </div>
  </section>

  <!-- PRODUCTS -->
  <section class="section" id="products">
    <div class="container">
      <div class="section-header">
        <div class="title-group"><h2>Trending now</h2><p>Bestsellers you'll love</p></div>
        <a href="#" class="view-all">View all <i class="fas fa-arrow-right"></i></a>
      </div>
      <div class="products-grid" id="productsGrid"></div>
    </div>
  </section>

  <!-- DEAL -->
  <section class="section" id="deals">
    <div class="container">
      <div class="section-header">
        <div class="title-group"><h2>⚡ Daily deal</h2><p>Limited stock – grab it now</p></div>
      </div>
      <div class="deal-wrap">
        <div class="deal-img">
          <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80" alt="MacBook Air" loading="lazy">
        </div>
        <div class="deal-content">
          <span class="tag"><i class="fas fa-bolt"></i> Flash sale</span>
          <h3>MacBook Air M2</h3>
          <p class="desc">Ultra‑portable, all‑day battery, and the M2 chip makes everything snappy.</p>
          <div><span class="price-big">$999 <span class="old">$1,199</span></span></div>
          <p class="stock">Only <strong>8</strong> left – hurry!</p>
          <div class="timer-grid" id="dealTimer">
            <div class="timer-box"><div class="num" id="dealDays">0</div><div
