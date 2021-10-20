<div id="Gcarousel" class="carousel slide" data-bs-ride="carousel">

  <div class="carousel-indicators">
    <button type="button" data-bs-target="#Gcarousel" data-bs-slide-to="0" class="active"></button>
    <?php
    for ($i = 1; $i <= 4; $i++) {
      echo '<button type="button" data-bs-target="#Gcarousel" data-bs-slide-to="' . $i . '"></button>';
    }

    ?>
  </div>

  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./pics/carousel/1.jpg" class="d-block w-100">
      <div class="carousel-caption d-none d-md-block">
        <h5 class="text-warning">Cookie Jar</h5>
        <p class="text-warning">Its more than just a cookie jar</p>
      </div>
    </div>
    <?php
    for ($i = 2; $i <= 5; $i++) {
      echo '<div class="carousel-item">
        <img src="./pics/carousel/' . $i . '.jpg" class="d-block w-100">
      </div>';
    }

    ?>
  </div>

  <button type="button" class="carousel-control-prev" data-bs-target="#Gcarousel" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button type="button" class="carousel-control-next" data-bs-target="#Gcarousel" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>

</div>

