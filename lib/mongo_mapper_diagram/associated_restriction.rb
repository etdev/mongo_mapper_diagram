module MongoMapperDiagram
  class AssociatedRestriction < Restriction
    attr_reader :opts

    def initialize(opts)
      @opts = opts
    end

    def restrict(documents)
      return documents unless opts[:associated]
      documents.select do |doc|
        associated_class_names(doc).include?(opts[:associated]) || doc.to_s == opts[:associated]
      end
    end

    private

    def associated_class_names(document)
      document.associations.values.map(&:class_name)
    end
  end
end
