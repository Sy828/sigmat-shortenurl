require 'net/http'
require 'json'
require 'geokit'

class LinksController < ApplicationController

    def create
        shortener = Shortener.new(link_params[:original_url])
        @link=shortener.generate_shorten_url
        @shorten_url = @link.shortened_url(request.base_url)
        #binding.pry

        if @link.persisted?
            respond_to :js
        else
            render 'error.js.erb'
        end

    end

    def show
        link=Link.where('created_at <= expire_date and lookup_code = ?', params[:lookup_code]).first
        if !link.nil? && !link.blank?
            get_analytics(link)
            redirect_to link.original_url
        else
            respond_to do |format|
                format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
                format.xml  { head :not_found }
                format.any  { head :not_found }
            end
        end
    end


    private
    def link_params
        params.require(:link).permit(:original_url)  
    end
end