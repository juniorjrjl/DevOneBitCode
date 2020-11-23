class BlockPositionsController < ApplicationController
    before_action :load_portfolio

    def update
        @rebuild_blocks_position = RebuildBlocksPositionsService.new(blocks_params["blocks"])
        save_blocks_position || render_old_position
    end

    private

    def render_old_position
        render json: {old_blocks: @portfolio.blocks}, status: :unprocessable_entity
    end

    def save_blocks_position
        if @rebuild_blocks_position.call
            head :ok
        end
    end

    def blocks_params
        params.permit(blocks:[:id, :position])
    end

    def load_portfolio
        @portfolio = policy_scope(Portfolio).find(params[:portfolio_id])
        authorize @portfolio, policy_class: PortfolioResourcePolicy
    end
end
