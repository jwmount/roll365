class WelcomeController < ApplicationController

=begin
  def show

    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
=end

  def faq
  end

  def about
  end

  def advertise
  end

  def contact
  end

  def privacy
  end

  # Terms and Condistions
  def tsandcs
  end

end
