namespace :mongo_mapper do
  desc "Generate Diagram from MongoMapper Document"
  task :diagram, [:args_exp]  => :environment do |t, args|
    options = Rack::Utils.parse_nested_query(args[:args_exp]).symbolize_keys
    Rails.application.eager_load!

    filename = ENV['DIAGRAM_NAME'] || './diagram'
    format = ENV['format'] || 'gif'

    g = MongoMapperDiagram::Generator.new(options)
    g.generate(filename, format.to_sym)
  end
end
