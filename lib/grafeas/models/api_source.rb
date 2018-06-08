=begin
#Grafeas API

#An API to insert and retrieve annotations on cloud artifacts.

OpenAPI spec version: v1alpha1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.0-SNAPSHOT

=end

require 'date'

module Grafeas
  # Source describes the location of the source used for the build.
  class ApiSource
    # If provided, get the source from this location in in Google Cloud Storage.
    attr_accessor :storage_source

    # If provided, get source from this location in a Cloud Repo.
    attr_accessor :repo_source

    # If provided, the input binary artifacts for the build came from this location.
    attr_accessor :artifact_storage_source

    # Hash(es) of the build source, which can be used to verify that the original source integrity was maintained in the build.  The keys to this map are file paths used as build source and the values contain the hash values for those files.  If the build source came in a single package such as a gzipped tarfile (.tar.gz), the FileHash will be for the single path to that file.
    attr_accessor :file_hashes

    # If provided, the source code used for the build came from this location.
    attr_accessor :context

    # If provided, some of the source code used for the build may be found in these locations, in the case where the source repository had multiple remotes or submodules. This list will not include the context specified in the context field.
    attr_accessor :additional_contexts

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'storage_source' => :'storage_source',
        :'repo_source' => :'repo_source',
        :'artifact_storage_source' => :'artifact_storage_source',
        :'file_hashes' => :'file_hashes',
        :'context' => :'context',
        :'additional_contexts' => :'additional_contexts'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'storage_source' => :'ApiStorageSource',
        :'repo_source' => :'ApiRepoSource',
        :'artifact_storage_source' => :'ApiStorageSource',
        :'file_hashes' => :'Hash<String, ApiFileHashes>',
        :'context' => :'ApiSourceContext',
        :'additional_contexts' => :'Array<ApiSourceContext>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'storage_source')
        self.storage_source = attributes[:'storage_source']
      end

      if attributes.has_key?(:'repo_source')
        self.repo_source = attributes[:'repo_source']
      end

      if attributes.has_key?(:'artifact_storage_source')
        self.artifact_storage_source = attributes[:'artifact_storage_source']
      end

      if attributes.has_key?(:'file_hashes')
        if (value = attributes[:'file_hashes']).is_a?(Hash)
          self.file_hashes = value
        end
      end

      if attributes.has_key?(:'context')
        self.context = attributes[:'context']
      end

      if attributes.has_key?(:'additional_contexts')
        if (value = attributes[:'additional_contexts']).is_a?(Array)
          self.additional_contexts = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          storage_source == o.storage_source &&
          repo_source == o.repo_source &&
          artifact_storage_source == o.artifact_storage_source &&
          file_hashes == o.file_hashes &&
          context == o.context &&
          additional_contexts == o.additional_contexts
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [storage_source, repo_source, artifact_storage_source, file_hashes, context, additional_contexts].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = Grafeas.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end