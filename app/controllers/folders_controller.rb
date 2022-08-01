class FoldersController < ApplicationController
  before_action :set_user, only: %i[create show edit destroy update]

  def index
    @user = current_user
    @folders = @user.folders
  end

  

  def show
    @folder = Folder.find(params[:id])
  end

  def new
    @folder = Folder.new
  end

  def create
    @user = current_user
    @folder = @user.folders.create(folder_params)

    if @folder.save
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entity
    end
  end
  

  def edit
    @folder = Folder.find(params[:id])
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update(folder_params)
      redirect_to @folder
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy
    redirect_to folders_path, status: :see_other
  end
  
  def delete_photo_attachment
    
    # image=params[:photo]
    @photo = ActiveStorage::Blob.find(params[:id])
    @photo.purge
   
     redirect_back(fallback_location: folder_path(params[:id]))
    # redirect_to @current_folder
  end

  private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def folder_params
    params.require(:folder).permit(:name, :description, :tag, photos:[])
  end
end
