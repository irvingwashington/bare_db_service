require 'spec_helper'

describe BareDBService::Table do
  let(:table_name) { "test_table" }
  let(:table) { described_class.new(table_name) }
  let(:schema_hash) {
    {
      "id" => :integer,
      "name" => :string,
      "foreign_id" => :integer,
      "created_at" => :datetime,
      "updated_at" => :datetime
    }
  }

  describe "initialization" do

    it "raises on unknown column" do
      expect{described_class.new("woot")}.
        to raise_exception(BareDBService::Table::TableNotFound)
    end

  end

  it "returns all tables array" do
    all = described_class.all
    expect(all.size).to eq(1)
    expect(all[0].table_name).to eq(table_name)
  end

  it "returns all table names" do
    all = described_class.table_names
    expect(all).to eq([table_name])
  end

  it "has table_name" do
    expect(table.table_name).to eq(table_name)
  end

  it "forms correct as_json hash" do
    expect(table.as_json).to eq(schema_hash)
  end

  it "forms correct json" do
    expect(table.to_json).to eq(schema_hash.to_json)
  end

  describe "#records" do

    it "delegates records to Record.all" do
      expect(BareDBService::Record).to receive(:all).with(table)
      table.records
    end

  end

end
