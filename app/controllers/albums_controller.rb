class AlbumsController < ApplicationController
        def index
            @albums = Album.all
        end
      
        def show
          @album = album.find(params[:id])
        end
      
        def new
          @album = album.new
        end
      
        def create
          @album = album.new(album_params)
      
          if @album.save
            redirect_to @album
          else
            render :new, status: :unprocessable_entity
          end
        end
      
        def edit
          @album = album.find(params[:id])
        end
      
        def update
          @album = album.find(params[:id])
      
          if @album.update(album_params)
            redirect_to @album
          else
            render :edit, status: :unprocessable_entity
          end
        end
      
        def destroy
          @album = album.find(params[:id])
          @album.destroy
      
          redirect_to root_path, status: :see_other
        end
      
        private
          def album_params
            params.require(:album).permit(:name, :description)
          end
end


