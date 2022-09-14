# type the following into irb
s = 'abc'
puts s.public_methods.inspect

=begin
irb(main):001:0> s = 'abc'
=> "abc"
irb(main):002:0> puts s.public_methods.inspect
[:encode, :encode!, :unpack, :unpack1, :include?, :%, :*, :+, :count, :partition, :to_c, :sum, :next, :casecmp, :casecmp?, :insert, :bytesize, :match, :match?, :succ!, :<=>, :next!, :upto, :index, :replace, :==, :===, :chr, :=~, :rindex, :[], :[]=, :byteslice, :getbyte, :setbyte, :clear, :scrub, :empty?, :eql?, :-@, :downcase, :scrub!, :dump, :undump, :upcase, :+@, :capitalize, :swapcase, :upcase!, :downcase!, :capitalize!, :swapcase!, :hex, :oct, :freeze, :inspect, :bytes, :chars, :codepoints, :lines, :reverse, :reverse!, :concat, :split, :crypt, :ord, :length, :size, :grapheme_clusters, :succ, :start_with?, :center, :prepend, :strip, :rjust, :rstrip, :ljust, :chomp, :delete_suffix, :sub, :to_str, :to_sym, :intern, :sub!, :lstrip, :<<, :to_s, :to_i, :to_f, :gsub!, :chop!, :chomp!, :delete_prefix, :gsub, :chop, :end_with?, :scan, :tr, :strip!, :lstrip!, :rstrip!, :delete_prefix!, :delete_suffix!, :delete!, :tr_s, :delete, :squeeze, :tr!, :tr_s!, :each_grapheme_cluster, :squeeze!, :each_line, :each_byte, :each_char, :each_codepoint, :b, :slice, :slice!, :hash, :encoding, :force_encoding, :unicode_normalize, :valid_encoding?, :ascii_only?, :rpartition, :unicode_normalize!, :unicode_normalized?, :to_r, :between?, :<=, :>=, :clamp, :<, :>, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :instance_variable_get, :instance_variable_set, :instance_variables, :singleton_method, :method, :public_send, :define_singleton_method, :public_method, :extend, :to_enum, :enum_for, :!~, :respond_to?, :object_id, :send, :display, :nil?, :class, :singleton_class, :clone, :dup, :itself, :yield_self, :then, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :equal?, :!, :__id__, :instance_exec, :!=, :instance_eval, :__send__]
=> nil
=end

# how would output only the methods contained in the String class? That is, exlcude the methods defined in 
# the Object, BasicObject and Kernel classes.

=begin
irb(main):005:0> puts s.public_methods(false).inspect
[:encode, :encode!, :unpack, :unpack1, :include?, :%, :*, :+, :count, :partition, :to_c, :sum, :next, :casecmp, :casecmp?, :insert, :bytesize, :match, :match?, :succ!, :<=>, :next!, :upto, :index, :replace, :==, :===, :chr, :=~, :rindex, :[], :[]=, :byteslice, :getbyte, :setbyte, :clear, :scrub, :empty?, :eql?, :-@, :downcase, :scrub!, :dump, :undump, :upcase, :+@, :capitalize, :swapcase, :upcase!, :downcase!, :capitalize!, :swapcase!, :hex, :oct, :freeze, :inspect, :bytes, :chars, :codepoints, :lines, :reverse, :reverse!, :concat, :split, :crypt, :ord, :length, :size, :grapheme_clusters, :succ, :start_with?, :center, :prepend, :strip, :rjust, :rstrip, :ljust, :chomp, :delete_suffix, :sub, :to_str, :to_sym, :intern, :sub!, :lstrip, :<<, :to_s, :to_i, :to_f, :gsub!, :chop!, :chomp!, :delete_prefix, :gsub, :chop, :end_with?, :scan, :tr, :strip!, :lstrip!, :rstrip!, :delete_prefix!, :delete_suffix!, :delete!, :tr_s, :delete, :squeeze, :tr!, :tr_s!, :each_grapheme_cluster, :squeeze!, :each_line, :each_byte, :each_char, :each_codepoint, :b, :slice, :slice!, :hash, :encoding, :force_encoding, :unicode_normalize, :valid_encoding?, :ascii_only?, :rpartition, :unicode_normalize!, :unicode_normalized?, :to_r]
=> nil
=end