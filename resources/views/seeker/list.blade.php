<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Blood Bank</title>

    <!-- Bootstrap core CSS -->
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/carousel.css') }}" rel="stylesheet">
    <style type="text/css">
        .btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
            background-color: #74100B !important;
        }

        .btn-success, .btn-success:hover, .btn-success:active, .btn-success:visited {
            background-color: #E0A84B !important;
        }

    </style>
  </head>
<!-- NAVBAR
================================================== -->
<body>
    <div class="navbar-wrapper">
        <div class="container">

            <nav class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Blood Bank</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="{{ url('/') }}">Home</a></li>
                            <li><a href="{{ url('seeker') }}">Seeker</a></li>
                            <li><a href="{{ url('donar') }}">Donar</a></li>
                            <li><a href="{{ url('/bloodrequested') }}">Seek Requested</a></li>
                            <li><a href="{{ url('/bloodrequire') }}">Blood Require</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>


    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="first-slide" src="{{ asset('img/aa.jpg') }}" alt="First slide">
                <div class="container">
                    <div class="carousel-caption"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="container marketing">
          <div class="row featurette">
            <div class="row">
                <div class="col-xs-12">
                  <h2>Donar List</small></h2>
                  <hr class="colorgraph">
                  @foreach($detail as $d)
                      <div class="col-xs-3 col-sm-offset-2">
                          <h5>Name: {{ $d->name }}</h5>
                          <h5>Email: {{ $d->email }}</h5>
                          <h5>Blood Type: {{ $d->type }}</h5>
                          <h5>Location: {{ $d->location_name }}</h5>
                          <h5>Address: {{ $d->address }}</h5>
                          <h5>Quantity: {{ $d->quantity }}</h5>
                          <hr class="colorgraph">
                          <a href="{{ url('/upgrade/' . $d->id) }}" class="btn btn-primary btn-block btn-lg">Feedback</a>
                      </div>
                  @endforeach
                </div>
            </div>
    <hr class="featurette-divider">
    <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>

    </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="{{ asset('js/bootstrap.min.js') }}"></script>
        <script src="{{ asset('js/holder.min.js') }}"></script>
    </body>
</html>
