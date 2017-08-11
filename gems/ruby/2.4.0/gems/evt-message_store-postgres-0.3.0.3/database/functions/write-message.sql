CREATE OR REPLACE FUNCTION write_message(
  _id varchar,
  _stream_name varchar,
  _type varchar,
  _data jsonb,
  _metadata jsonb DEFAULT NULL,
  _expected_version int DEFAULT NULL
)
RETURNS int
AS $$
DECLARE
  message_id uuid;
  stream_version int;
  position int;
  category varchar;
BEGIN
  message_id = uuid(_id);

  stream_version := stream_version(_stream_name);

  if stream_version is null then
    stream_version := -1;
  end if;

  if _expected_version is not null then
    if _expected_version != stream_version then
      raise exception 'Wrong expected version: % (Stream: %, Stream Version: %)', _expected_version, _stream_name, stream_version;
    end if;
  end if;

  position := stream_version + 1;

  insert into "messages"
    (
      "id",
      "stream_name",
      "position",
      "type",
      "data",
      "metadata"
    )
  values
    (
      message_id,
      _stream_name,
      position,
      _type,
      _data,
      _metadata
    )
  ;

  return position;
END;
$$ LANGUAGE plpgsql;
