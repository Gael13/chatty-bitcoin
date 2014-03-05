module Transactions
  class Import
  	class << self
  	  def from_blockexplorer(addresses)
  	  	json = Api::BlockExplorer.mytransactions(addresses)
  	  	json.collect do |tx_hash, tx_json|
  	  	  create_transaction tx_hash, tx_json
  	  	end
  	  end
  	  
  	  def from_tx(tx, options = {})
  	    tx = Bitcoin::Protocol::tx.new(tx.to_payload)
  	    tx_hash = tx.hash 
  	    tx_json = tx.to_hash
  	    create_transaction tx_hash, tx_json, options
      end

      private

      def create_transaction(tx_hash, tx_json, options = {})
      	begin
      	  Transaction.find_by_bitcoin_tx_hash!(tx_hash)
      	rescue ActiveRecord::RecordNotFound
      	  tx = Bitcoin::Protocol::Tx.from_hash(tx_json)
      	  Transaction.create!(binary: tx.to_payload, bitcoin_tx_hash: tx_hash, comment: options[:comment]) 
      	end
      end
    end
  end
end      	   
  	    