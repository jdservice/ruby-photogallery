class UploadImagesController < ApplicationController

  def uploadFile
    post = UploadImage.save(params[:upload])
    render :text => "Image has been uploaded successfully"
  end

end