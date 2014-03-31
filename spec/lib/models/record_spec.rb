require 'spec_helper'


describe BareDBService::Record do
  let(:table_name) { "test_table" }
  let(:table) { BareDBService::Table.new(table_name) }

  let(:obj) { table.orm.create(name: "test", foreign_id: 10) }
  let(:record) { described_class.new(obj) }

  before(:each) do
    table.orm.delete_all
  end

  it "forms correct as_json hash" do
    json_hash = record.as_json
    expect(json_hash).to be_a(Hash)
    expect(json_hash.keys).to eq(%w{id name foreign_id created_at updated_at})
  end

  it "finds record by id" do
    record_id = record.orm_obj.id
    r = described_class.find(table, record_id)
    expect(r).to be_a(BareDBService::Record)
    expect(r.orm_obj.id).to eq(record_id)
  end

  it "finds all array" do
    record
    all = described_class.all(table)
    expect(all.size).to eq(1)
  end

end
