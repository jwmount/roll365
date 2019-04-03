class WelcomeController < ApplicationController

  
  def index
  end
  #
  # Appears to be unnecessary, if invalid method is sent in will respond with a 404?
  # May want to use method_missing here?  For now, just begin - rescue if file not found.
  #
  def show
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end


  # What we do
  def about
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/about", :layout => false, :status => :not_found
    end    
  end

  # How to put adds on our pages and possibly some promotions
  def advertise
     begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/avertise", :layout => false, :status => :not_found
    end
  end

  # How to reach us
  def contact
        begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/contact", :layout => false, :status => :not_found
    end
  end

  # Frequently asked questions
  def faq
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/faq", :layout => false, :status => :not_found
    end    
  end

  # Privacy policy
  def privacy
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/privacy", :layout => false, :status => :not_found
    end
  end

  # Terms and Condistions
  def tsandcs
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/tsandcs", :layout => false, :status => :not_found
    end
  end


end
