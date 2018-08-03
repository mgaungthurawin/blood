<!DOCTYPE HTML>
<html>
    <head>
        <title>Wave World</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="{{asset('css/style.css')}}" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="text-center">
            <img src="{{url('img/blood-bank-logo.jpg')}}" alt="Blood Band"  class="logo"/>
        </div>

        @yield('content')
        

        <script type="text/javascript" src="{{asset('js/jquery-3.2.1.min.js')}}"></script>
        <script type="text/javascript" src="{{asset('js/svgxuse.js')}}"></script>

        <script type="text/javascript">
            $(document).on('click', '#check', function () {
                var type = $("input[name=type]:checked").val();
                if (type == 'donar') {
                   window.location.href = "{{url('/donar')}}";
                } else if (type == 'seeker') {
                    window.location.href = "{{url('/seeker')}}";
                } else {
                    alert('please select ');
                    // swal("oop...", "Something wrong", "error")
                }
            })

        </script>


    </body>
</html>










