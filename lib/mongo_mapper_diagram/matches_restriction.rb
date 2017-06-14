module MongoMapperDiagram
  class MatchesRestriction < Restriction
    attr_reader :opts

    def initialize(opts)
      @opts = opts
    end

    def restrict(document)
      document.select{ |doc| include_regexp === doc.to_s }
        .reject{ |doc| exclude_regexp === doc.to_s }
    end

    private

    def include_regexp
      return // unless opts[:include]
      @_iclude_regexp ||= /#{[*opts.fetch(:include, "")].join("|")}/
    end

    def exclude_regexp
      return /\A\z/ unless opts[:exclude]
      @_exclude_regexp ||= /#{[*opts.fetch(:exclude, "")].join("|")}/
    end
  end
end
