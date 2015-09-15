Given "I'm merchant $id with the items" do |id, items|
  @merchant    = Merchant.new
  @merchant.id = id.to_i
  items.hashes.each { |item_hash| @merchant.items.build item_hash }
  @merchant.save!
end

When "I request: GET $path" do |path|
  @response = get path
end

Then "the response has status: $status, type: $type" do |status, type|
  expect(@response.status).to eq status.to_i
  expect(@response.content_type).to eq type
end

Then(/^the response has a body of JSON hashes matching:$/) do |hashes|
  expected_hashes = hashes.each_line.map { |line| JSON.parse line.chomp }
  actual_hashes   = JSON.parse(@response.body)

  expected_hashes.zip(actual_hashes).each do |expected, actual|
    expected.each do |key, value|
      expect(actual[key]).to eq value
    end
  end
end
