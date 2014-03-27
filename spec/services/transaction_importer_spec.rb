require 'spec_helper'

describe TransactionImporter do
  let(:addresses) { stub }

  describe 'refresh' do 

  	it "calls refresh_for with all bitcoin address" do
  	  BitcoinAddress.stub_chain(:all, :collect).and_return(addresses)
  	  TransactionImporter.should_receive(:refresh_for).with(addresses)
  	  TransactionImporter.refresh 
  	end
  end

  describe "refresh_for" do
    let(:transactions) { stub }

    it "get transactions from block explore than imports them" do
      Transactions::Import.should_receive(:from_blockexplorer).with(addresses) { transactions }
      Transactions::ProcessPayments.should_receive(:for).with(transactions)
      TransactionsImporter.refresh_for addresses
    end
  end     	  

  describe "import_and_process_tx" do
    let(:tx) { stub }
    let(:transation) { stub }
    let(:comment) { stub }

    it "imports then process the said tx" do
      Transactions::Import.should_receive(:from_tx).with(tx, {comment: comment}) { transaction }
      Transaction::ProcessPayments.should_receive(:for).with([transaction])
      TransactionImporter.import_and_process_tx(tx, {comment: comment})
    end
  end    	
end