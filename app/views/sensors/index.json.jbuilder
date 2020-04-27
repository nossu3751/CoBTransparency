json.type "FeatureCollection"
json.features @sensors.each do |sensor|
    if sensor.hidden == false
        # p = Point.find_by(identifier: sensor.id)
        json.type "Feature"
        json.set! :geometry do
            json.set! :type, "Point"
            longlat = [sensor.longitude, sensor.latitude]
            json.set! :coordinates, longlat
        end
        json.set! :properties do
            json.set! :id, sensor.id
            
            json.set! :sensor_type, sensor.sensor_type
            json.set! :ownership, sensor.owner
            json.set! :description, sensor.description
        end
    end
end
