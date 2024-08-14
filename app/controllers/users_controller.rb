class UsersController < ApplicationController
  def show
    @user = current_user
    @bookings = @user.bookings
    @flats = @user.flats
  end
end
