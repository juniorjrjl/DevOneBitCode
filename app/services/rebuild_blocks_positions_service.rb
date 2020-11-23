class RebuildBlocksPositionsService
    def initialize(blocks)
        @blocks = blocks
    end

    def call
        Block.transaction do
            perform_blocks_position
        end
    end

    private

    def perform_blocks_position
        @blocks.each do |b|
            Block.find(b[:id]).update!(position: b[:position])
        end
    end
end