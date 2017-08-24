require_relative '../spec_helper'

describe "ReportParser" do
  it "should parse the report text into an informative hash" do
    spam = File.read('spec/data/spam_test1.txt')
    result = RubySpamAssassin::ReportParser.parse(spam)

    expect(result.length).to eql(6)

    # Check contents of first one to make sure text/points are formatted correctly
    expect(result[0][:pts]).to eql(0.5)
    expect(result[0][:rule]).to eql('DATE_IN_PAST_24_48')
    expect(result[0][:text]).to eql('Date: is 24 to 48 hours before Received: date')

    expect(result[1][:pts]).to eql(0.0)
    expect(result[1][:rule]).to eql('HTML_MESSAGE')
    expect(result[1][:text]).to eql('BODY: HTML included in message')
  end
end
