function obj = getSchema
persistent schemaObject
if isempty(schemaObject)
    schemaObject = dj.Schema(dj.conn, 'ex1', 'ex1');
end
obj = schemaObject;
end
