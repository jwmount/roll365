class IdentifiersController  < ApplicationController # < InheritedResources::Base< InheritedResources::Base


  def index
    case 
      
      when params.has_key?(:company_id) then
        @parent = Company.find(params[:company_id])
        @identifiers = @parent.identifiers
      
      when params.has_key?(:person_id) then
        @parent = Person.find(params[:person_id])
        @identifiers = @parent.identifiers
      
      else
        @identifiers = Identifier.all
    end
    
    @q = @identifiers.ransack(params[:q])

    #@q = Identifier.ransack(params[:q]).where("identifiable_type = ? AND identifiable_type = ?", @company.id)
    @identifiers = @q.result.order(name: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
    flash[:Notification] = "Reminder:  Identifiers (or Contacts) can only be created from companies or people finders."
  end
  #
  # No direct operation is allowed, must be from an -able or belongs_to parent
  #
  def new
    case 
    when params.has_key?(:company_id)
      @parent = Company.find(params[:person_id])
      #@identifier = @parent.identifiers.new
      
    when params.has_key?(:person_id) then
      @parent = Person.find(params[:person_id])
      #@identifier = @parent.identifiers.new
    end
    begin
      @identifier = @parent.identifiers.new
      @identifier.save!
    rescue
      redirect_to root_path, notice = "Attempt to instatiate a new identifier failed."
    end
  end

  def edit
    @identifier = Identifier.find(params[:id])
    begin
      @name = @identifier.identifiable.display_name
    rescue
      @name = flash["Identifier has unknown display_name"]
    end
  end

  def show
    @identifier = Identifier.find( params[:id] )
    @name = @identifier.identifiable.display_name
    flash[:Information] = "Rank or Priority denotes the prefered order of use for a specific way to reach the other party."
  end

  def destroy
    @identifier = Identifier.find( params[:id] )
    @identifier.destroy
    respond_to do |format|
      format.html { redirect_to companies_path, notice: 'Contact was successfully deleted.' }
      format.json { head :no_content }
    end
  end


 # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @identifier = Identifier.find(params[:id])
    respond_to do |format|
      if @identifier.update!(identifier_params)
        format.html { redirect_to @identifier, notice: "{@identifier} has been updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @identifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @identifier = Identifier.find(params[:id])
    @identifier.destroy
    respond_to do |format|
      format.html { redirect_to company_identifiers_path(@identifier.identifiable), notice: "#{@identifier.name} has been deleted." }
      format.json { head :no_content }
    end
  end

  private

    def identifier_params
      params.require(:identifier).permit(:identifiable_type, :identifiable_id, :name, :value, :rank)
    end
end

