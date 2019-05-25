class MaterialsController  < ApplicationController # < InheritedResources::Base< InheritedResources::Base


  def index
    @q = Material.ransack(params[:q])
    @materials = @q.result.order(name: 'ASC').paginate(page: params[:page], per_page: 10 || params[:per_page])
  end

  def show
  	@material = Material.find(params[:id])
  end
 
   def edit
   	@material = Material.find(params[:id])
   end

   def new
   	@material = Material.new
   end

  # POST /material
  # POST /material.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material/1
  # PATCH/PUT /material/1.json
  def update
    @material = Material.find.(params[:id])
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material/1
  # DELETE /material/1.json
  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_path, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def material_params
      params.require(:material).permit(:name, :description)
    end

end

