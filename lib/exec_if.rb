class Object
  def exec_if(obj, &blk)
    case obj
    when Proc
      obj.call(self) ? instance_exec(obj, &blk) : self
    when Symbol
      public_send(obj) ? instance_exec(obj, &blk) : self
    when String
      instance_eval(obj) ? instance_exec(obj, &blk) : self
    when Object
      obj ? instance_exec(obj, &blk) : self
    when nil, false
      self
    end
  end
end
