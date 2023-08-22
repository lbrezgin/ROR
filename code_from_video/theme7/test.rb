class String
  def self.random(length)
    rand(36**length).to_s(36)
  end

  def my_method
    capitalize
  end
end
def destroy
  @object = Object.find(params[:id])
  if @object.destroy
    flash[:success] = 'Object was successfully deleted.'
    redirect_to objects_url
  else
    flash[:error] = 'Something went wrong'
    redirect_to objects_url
  end
end
