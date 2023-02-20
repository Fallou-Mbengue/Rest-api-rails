module ApiHelpers
    def json
        JSON.parse(response.body, symbolize_names: true)
    end

    def json_data
        json[:data]
    end
end
 