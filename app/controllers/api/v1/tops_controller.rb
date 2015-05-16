class Api::V1::TopsController < Api::V1::BaseController
  before_action :set_top, only: [:show, :edit, :update, :destroy]

  respond_to :json

  before_filter :authenticate_user!, :except => [:index, :show]

  attr_reader :user_id


  # GET /tops
  def index
    @tops = Top.all
  end

  # GET /tops/1
  def show
  end

  # POST /tops
  def create
    @top = Top.new(top_params)
    @top.user = current_user

    if @top.save
      render :status => :created,
             :json => { :success => true,
                        :info => @top
             }
    else
      render :status => :unprocessable_entity,
             :json => { :success => true,
                        :info => @top.errors
             }
    end

  end

  # PATCH/PUT /tops/1
  def update

    if @top.user == current_user

      if @top.update(top_params)
        render :status => :ok,
               :json => { :success => true,
                          :info => @top
               }
      else
        render :status => :unprocessable_entity,
               :json => { :success => true,
                          :info => @top.errors
               }
      end

    else
      render :status => :unauthorized,
             :json => { :success => false,
                        :info => :unauthorized
             }
    end
  end

  # DELETE /tops/1
  def destroy
    if @top.user == current_user

      if @top.destroy
        render :status => :ok,
               :json => { :success => true,
                          :info => 'Top deleted'
               }
      else
        render :status => :unprocessable_entity,
               :json => { :success => true,
                          :info => @top.errors
               }
      end

    else
      render :status => :unauthorized,
             :json => { :success => false,
                        :info => :unauthorized
             }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top
      @top = Top.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_params
      params.require(:top).permit(:title, :tags, :category)
    end
end
