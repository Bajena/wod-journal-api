module JsonApiHelpers
  def json(*keys)
    @json ||= parse_json
    return @json if keys.empty?

    value = keys.inject(@json) { |a, e| a.fetch(e) }
    return value.map(&:deep_symbolize_keys) if value.class == Array
    value
  end

  def parse_json
    JSON.parse(response.body).deep_symbolize_keys
  end

  def json_api_find(opts)
    find_first(json[:data], opts)
  end

  def json_api_find_included(opts)
    find_first(json[:included], opts)
  end

  def json_api_find_all_included(opts)
    json[:included].find_all do |i|
      i_sym = i.deep_symbolize_keys
      i_sym.merge(opts) == i_sym
    end.map(&:deep_symbolize_keys)
  end

private

  def find_first(from, opts)
    from.find do |i|
      i_sym = i.deep_symbolize_keys
      i_sym.merge(opts) == i_sym
    end.try(:deep_symbolize_keys)
  end
end
