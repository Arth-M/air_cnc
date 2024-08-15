// app/javascript/controllers/flat_review_stars_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["star", "rating"]

  connect() {
    this.stars = this.starTargets;
    this.rating = this.ratingTargets;
  }

  toggleColorStars(rating) {
    this.stars.forEach((star) => {
      if (star.dataset.id <= rating) {
        star.className = "review-rating fas fa-star";
      } else {
        star.className = "review-rating far fa-star";
      }
    });
  }

  updateRatingForm(rating) {
    this.rating.value = rating;
  }

  selectRating(event) {
    const rating = event.currentTarget.dataset.id;
    this.updateRatingForm(rating);
    this.toggleColorStars(rating);
    event.currentTarget.classList.add("selected");
  }

  hoverRating(event) {
    const rating = event.currentTarget.dataset.id;
    if (!this.hasSelectedStar()) {
      this.toggleColorStars(rating);
    }
  }

  resetStars() {
    if (!this.hasSelectedStar()) {
      this.stars.forEach((star) => {
        star.className = "review-rating far fa-star";
      });
    }
  }

  hasSelectedStar() {
    return this.stars.some(star => star.classList.contains("selected"));
  }
}
