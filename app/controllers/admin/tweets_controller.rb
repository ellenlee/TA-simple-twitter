class Admin::TweetsController < Admin::BaseController
  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  def destroy
    @tweet = Tweet.find(params[:id])

    if @tweet.destroy
      redirect_to admin_root_path
    end
  end
end
