<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <meta name="copyright" content="">

    <title>Page 1</title>

    <link rel="stylesheet" href="{{ asset('public/assets/css/maicons.css') }}">

    <link rel="stylesheet" href="{{ asset('public/assets/css/bootstrap.css') }}">

    <link rel="stylesheet" href="{{ asset('public/assets/vendor/animate/animate.css') }}">

    <link rel="stylesheet" href="{{ asset('public/assets/css/theme.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- custom css -->
    <link rel="stylesheet" href="{{ asset('public/assets/css/style.css') }}">
    <!-- review slider css start -->
    <link rel="stylesheet" href="{{ asset('public/assets/slider/slick/slick.css') }}">
    <link rel="stylesheet" href="{{ asset('public/assets/slider/slick/slick-theme.css') }}">


    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap" rel="stylesheet">
    <style>
    .slider {
        width: 100%;
        margin: 3% auto;
    }

    .slick-slide {
        margin: 0px 20px;
    }

    .slick-slide img {
        width: 100%;
    }

    .slick-prev:before,
    .slick-next:before {
        color: black;
    }


    .slick-slide {
        transition: all ease-in-out .3s;
        opacity: .2;
    }

    .slick-active {
        opacity: .5;
    }

    .slick-current {
        opacity: 1;
    }

    section.center.slider img {
        width: 110%;
        height: auto;
        border-radius: 5px;
    }

    .slick-current img {
        border: 1px solid #099146;
        box-shadow: 3px 5px 20px 4px rgb(127 149 116 / 31%);
    }
    </style>

    @yield('styles')

</head>

<body>

    <!-- Back to top button -->
    <div class="back-to-top"></div>

    <br/>
    <br/>

    @yield('content')


    


    <form id="logoutform" action="{{ route('logout') }}" method="POST" style="display: none;">
        {{ csrf_field() }}
    </form>

    

    <!-- =====================================
    ===== WEbsite footer section end  here ==
    ========================================== -->

    <script src="{{ asset('public/assets/js/jquery-3.5.1.min.js') }}" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>


    <script src="{{ asset('public/assets/js/bootstrap.bundle.min.js') }}"></script>

    <script src="{{ asset('public/assets/js/google-maps.js') }}"></script>

    <script src="{{ asset('public/assets/vendor/wow/wow.min.js') }}"></script>

    <script src="{{ asset('public/assets/js/theme.js') }}"></script>

    <!-- review slider -->
    <script src="{{ asset('public/assets/slider/slick/slick.js') }}"></script>


    <script src="https://apis.google.com/js/platform.js"></script>

    <script>
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";

    $(window).on("load resize", function() {
        if (this.matchMedia("(min-width: 768px)").matches) {
            $dropdown.hover(
                function() {
                    const $this = $(this);
                    $this.addClass(showClass);
                    $this.find($dropdownToggle).attr("aria-expanded", "true");
                    $this.find($dropdownMenu).addClass(showClass);
                },
                function() {
                    const $this = $(this);
                    $this.removeClass(showClass);
                    $this.find($dropdownToggle).attr("aria-expanded", "false");
                    $this.find($dropdownMenu).removeClass(showClass);
                }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });
    </script>

    <!-- Review slider -->
    <script type="text/javascript">
    $(document).on('ready', function() {

        $(".center").slick({
            dots: true,
            infinite: true,
            centerMode: true,
            slidesToShow: 4,
            slidesToScroll: 3
        });

    });
    </script>
    @yield('scripts')

</body>

</html>