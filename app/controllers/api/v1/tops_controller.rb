class Api::V1::TopsController < Api::V1::BaseController
  before_action :set_top, only: [:show, :edit, :update, :destroy]

  respond_to :json

  before_filter :authenticate_user!, :except => [:index, :show]

  attr_reader :user_id


  # GET /tops
  def index

    if params[:filters]
      #FIXME
      unless params[:filters][:start_date].nil? and params[:filters][:end_date].nil?
        start_date = Date.strptime(params[:filters][:start_date], '%d/%m/%Y')
        end_date = Date.strptime(params[:filters][:end_date], '%d/%m/%Y')
        @tops = Top.where('created_at >= ? and created_at <=?', start_date, end_date).order('created_at desc')
      end

      unless params[:filters][:user_id].nil?
        @tops = Top.where(:user => params[:filters][:user_id])
      end

    else
      @tops = Top.all
    end
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
      params.require(:top).permit(:title, :tags, :category, :items, :filters)
    end
end
