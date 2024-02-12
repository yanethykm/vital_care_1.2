﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Presentacion.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form class="row g-3" runat="server">
        <main>

            <section class="hero-section hero-slide d-flex justify-content-center align-items-center" id="section_1">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-8 col-12 text-center mx-auto">
                            <div class="hero-section-text">
                                <small class="section-small-title">Bienvenido a tu Droguería <i class="hero-icon bi-house"></i></small>

                                <h1 class="hero-title text-white mt-2 mb-4">Vital Care</h1>



                                <div class="hero-btn d-flex justify-content-center align-items-center">
                                    <a class="bi-arrow-down hero-btn-link smoothscroll" href="#section_2"></a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 681px; width: 875px; z-index: -999998; position: absolute;">
                    <img style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1021.5px; height: 681px; max-height: none; max-width: none; z-index: -999999; left: -73.25px; top: 0px;" src="images/slideshow/interior-wall-mockup-with-sofa-cabinet-living-room-with-empty-white-wall-background-3d-rendering.jpg" class="deleteable">
                    <img style="position: absolute; margin: 0px; padding: 0px; border: none; width: 972.857px; height: 681px; max-height: none; max-width: none; z-index: -999999; opacity: 0.460248; left: -48.9286px; top: 0px;" src="images/slideshow/wood-sideboard-living-room-interior-with-copy-space.jpg">
                </div>
            </section>




            <section class="contact-section" id="section_2">
                <svg xmlns="#" viewbox="0 0 1440 320">
                    <path fill="#f9f9f9" fill-opacity="1" d="M0,96L40,117.3C80,139,160,181,240,186.7C320,192,400,160,480,149.3C560,139,640,149,720,176C800,203,880,245,960,250.7C1040,256,1120,224,1200,229.3C1280,235,1360,277,1400,298.7L1440,320L1440,0L1400,0C1360,0,1280,0,1200,0C1120,0,1040,0,960,0C880,0,800,0,720,0C640,0,560,0,480,0C400,0,320,0,240,0C160,0,80,0,40,0L0,0Z"></path>
                </svg>
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12">
                            <small class="section-small-title">Vital Care.</small>

                            <h2 class="mb-4">Comunicate con nosotros</h2>
                        </div>

                        <div class="col-lg-6 col-12">
                            <form class="custom-form contact-form" action="#" method="post" role="form">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="input-group align-items-center">
                                            <label for="first-name">First Name</label>

                                            <input type="text" name="first-name" id="first-name" class="form-control" placeholder="Jack" required>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="input-group align-items-center">
                                            <label for="last-name">Last Name</label>

                                            <input type="text" name="last-name" id="last-name" class="form-control" placeholder="Doe" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="input-group align-items-center">
                                    <label for="email">Email Address</label>

                                    <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Jackdoe@gmail.com" required>
                                </div>

                                <div class="input-group textarea-group">
                                    <label for="message">Message</label>

                                    <textarea name="message" rows="6" class="form-control" id="message" placeholder="What can we help you?"></textarea>
                                </div>

                                <div class="col-lg-3 col-md-4 col-6">
                                    <button type="submit" class="form-control">Send</button>
                                </div>
                            </form>
                        </div>

                        <div class="col-lg-6 col-12 mt-5 mt-lg-0">
                            <div class="custom-block">

                                <h3 class="text-white mb-2">Store</h3>

                                <p class="text-white mb-2">
                                    <i class="contact-icon bi-geo-alt me-1"></i>

                                    102 Utah Road, Berlin, Germany
                                </p>

                                <h3 class="text-white mt-3 mb-2">Contact Info</h3>

                                <div class="d-flex flex-wrap">
                                    <p class="text-white mb-2 me-4">
                                        <i class="contact-icon bi-telephone me-1"></i>

                                        <a href="tel: 090-080-0760" class="text-white">090-080-0760
                                        </a>
                                    </p>

                                    <p class="text-white">
                                        <i class="contact-icon bi-envelope me-1"></i>

                                        <a href="#" class="text-white">servicio@vitalcare.com
                                        </a>
                                    </p>
                                </div>

                                <iframe class="google-map mt-2" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4800.184803804974!2d-0.10174304922518053!3d51.5087879746898!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487605f6fc62fa3d%3A0xc5a39e7cf4e3a9a4!2sTate%20Modern%20Garden!5e1!3m2!1sen!2smm!4v1679331839559!5m2!1sen!2smm" width="100%" height="220" style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                <path fill="#36363e" fill-opacity="1" d="M0,96L40,117.3C80,139,160,181,240,186.7C320,192,400,160,480,149.3C560,139,640,149,720,176C800,203,880,245,960,250.7C1040,256,1120,224,1200,229.3C1280,235,1360,277,1400,298.7L1440,320L1440,320L1400,320C1360,320,1280,320,1200,320C1120,320,1040,320,960,320C880,320,800,320,720,320C640,320,560,320,480,320C400,320,320,320,240,320C160,320,80,320,40,320L0,320Z"></path>
            </svg>
        </main>

        <footer class="site-footer section-padding">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-5 col-12 mb-3">
                        <h3><a href="index.html" class="custom-link mb-1">Vital Care</a></h3>

                        <p class="text-white">Since 1986</p>

                        <p class="text-white"><a href="#" target="_parent"></a></p>
                    </div>

                    <div class="col-lg-3 col-md-3 col-12 ms-lg-auto mb-3">
                        <h3 class="text-white mb-3">Store</h3>

                        <p class="text-white mt-2">
                            <i class="bi-geo-alt"></i>
                            Popayán, Colombia
                        </p>
                    </div>

                    <div class="col-lg-3 col-md-4 col-12 mb-3">
                        <h3 class="text-white mb-3">Contact Info</h3>

                        <p class="text-white mb-1">
                            <i class="bi-telephone me-1"></i>

                            <a href="tel: 090-080-0760" class="text-white">090-080-0760
                            </a>
                        </p>

                        <p class="text-white mb-0">
                            <i class="bi-envelope me-1"></i>

                            <a href="#" class="text-white">servicio@vitalcare.com
                            </a>
                        </p>
                    </div>

                    <div class="col-lg-6 col-md-7 copyright-text-wrap col-12 d-flex flex-wrap align-items-center mt-4 ms-auto">
                        <p class="copyright-text mb-0 me-4">Copyright © Moso Interior 2048</p>

                        <ul class="social-icon">
                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link social-icon-twitter bi-twitter"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link social-icon-facebook bi-facebook"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link social-icon-instagram bi-instagram"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link social-icon-pinterest bi-pinterest"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link social-icon-whatsapp bi-whatsapp"></a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </footer>
    </form>
</asp:Content>
