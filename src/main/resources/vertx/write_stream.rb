require 'vertx/stream_base'
require 'vertx/util/utils.rb'
# Generated from io.vertx.core.streams.WriteStream
module Vertx
  module WriteStream
    include ::Vertx::StreamBase
    #  Set an exception handler on the write stream.
    # @yield the exception handler
    # @return [self]
    def exception_handler
      if block_given?
        @j_del.java_method(:exceptionHandler, [Java::IoVertxCore::Handler.java_class]).call((Proc.new { |event| yield(::Vertx::Util::Utils.from_throwable(event)) }))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling exception_handler()"
    end
    #  Write some data to the stream. The data is put on an internal write queue, and the write actually happens
    #  asynchronously. To avoid running out of memory by putting too much on the write queue,
    #  check the {::Vertx::WriteStream#write_queue_full} method before writing. This is done automatically if using a {::Vertx::Pump}.
    # @param [Object] data the data to write
    # @return [self]
    def write(data=nil)
      if (data.class == String  || data.class == Hash || data.class == Array || data.class == NilClass || data.class == TrueClass || data.class == FalseClass || data.class == Fixnum || data.class == Float) && !block_given?
        @j_del.java_method(:write, [Java::java.lang.Object.java_class]).call(::Vertx::Util::Utils.to_object(data))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling write(data)"
    end
    #  Same as {::Vertx::WriteStream#end} but writes some data to the stream before ending.
    # @param [Object] t 
    # @return [void]
    def end(t=nil)
      if !block_given? && t == nil
        return @j_del.java_method(:end, []).call()
      elsif (t.class == String  || t.class == Hash || t.class == Array || t.class == NilClass || t.class == TrueClass || t.class == FalseClass || t.class == Fixnum || t.class == Float) && !block_given?
        return @j_del.java_method(:end, [Java::java.lang.Object.java_class]).call(::Vertx::Util::Utils.to_object(t))
      end
      raise ArgumentError, "Invalid arguments when calling end(t)"
    end
    #  Set the maximum size of the write queue to <code>maxSize</code>. You will still be able to write to the stream even
    #  if there is more than <code>maxSize</code> items in the write queue. This is used as an indicator by classes such as
    #  <code>Pump</code> to provide flow control.
    #  <p/>
    #  The value is defined by the implementation of the stream, e.g in bytes for a
    #  {::Vertx::NetSocket}, the number of {::Vertx::Message} for a
    #  {::Vertx::MessageProducer}, etc...
    # @param [Fixnum] maxSize the max size of the write stream
    # @return [self]
    def set_write_queue_max_size(maxSize=nil)
      if maxSize.class == Fixnum && !block_given?
        @j_del.java_method(:setWriteQueueMaxSize, [Java::int.java_class]).call(maxSize)
        return self
      end
      raise ArgumentError, "Invalid arguments when calling set_write_queue_max_size(maxSize)"
    end
    #  This will return <code>true</code> if there are more bytes in the write queue than the value set using {::Vertx::WriteStream#set_write_queue_max_size}
    # @return [true,false] true if write queue is full
    def write_queue_full?
      if !block_given?
        return @j_del.java_method(:writeQueueFull, []).call()
      end
      raise ArgumentError, "Invalid arguments when calling write_queue_full?()"
    end
    #  Set a drain handler on the stream. If the write queue is full, then the handler will be called when the write
    #  queue is ready to accept buffers again. See {::Vertx::Pump} for an example of this being used.
    #  <p/>
    #  The stream implementation defines when the drain handler, for example it could be when the queue size has been
    #  reduced to <code>maxSize / 2</code>.
    # @yield the handler
    # @return [self]
    def drain_handler
      if block_given?
        @j_del.java_method(:drainHandler, [Java::IoVertxCore::Handler.java_class]).call(Proc.new { yield })
        return self
      end
      raise ArgumentError, "Invalid arguments when calling drain_handler()"
    end
  end
  class WriteStreamImpl
    include WriteStream
    # @private
    # @param j_del [::Vertx::WriteStream] the java delegate
    def initialize(j_del)
      @j_del = j_del
    end
    # @private
    # @return [::Vertx::WriteStream] the underlying java delegate
    def j_del
      @j_del
    end
  end
end
