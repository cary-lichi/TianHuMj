# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: guo_pai.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
from google.protobuf import descriptor_pb2
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


import pai_pb2 as pai__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='guo_pai.proto',
  package='',
  syntax='proto2',
  serialized_pb=_b('\n\rguo_pai.proto\x1a\tpai.proto\"@\n\rGuoPaiRequest\x12\x0f\n\x07nUserID\x18\x01 \x02(\x05\x12\x0f\n\x07sRoomID\x18\x02 \x02(\t\x12\r\n\x05nType\x18\x03 \x02(\x05\"$\n\x0eGuoPaiResponse\x12\x12\n\nnErrorCode\x18\x01 \x02(\x05\"0\n\x0cGuoPaiNotify\x12\x0f\n\x07nUserID\x18\x01 \x02(\x05\x12\x0f\n\x07sRoomID\x18\x02 \x02(\t')
  ,
  dependencies=[pai__pb2.DESCRIPTOR,])




_GUOPAIREQUEST = _descriptor.Descriptor(
  name='GuoPaiRequest',
  full_name='GuoPaiRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nUserID', full_name='GuoPaiRequest.nUserID', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='sRoomID', full_name='GuoPaiRequest.sRoomID', index=1,
      number=2, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='nType', full_name='GuoPaiRequest.nType', index=2,
      number=3, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=28,
  serialized_end=92,
)


_GUOPAIRESPONSE = _descriptor.Descriptor(
  name='GuoPaiResponse',
  full_name='GuoPaiResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nErrorCode', full_name='GuoPaiResponse.nErrorCode', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=94,
  serialized_end=130,
)


_GUOPAINOTIFY = _descriptor.Descriptor(
  name='GuoPaiNotify',
  full_name='GuoPaiNotify',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nUserID', full_name='GuoPaiNotify.nUserID', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='sRoomID', full_name='GuoPaiNotify.sRoomID', index=1,
      number=2, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=132,
  serialized_end=180,
)

DESCRIPTOR.message_types_by_name['GuoPaiRequest'] = _GUOPAIREQUEST
DESCRIPTOR.message_types_by_name['GuoPaiResponse'] = _GUOPAIRESPONSE
DESCRIPTOR.message_types_by_name['GuoPaiNotify'] = _GUOPAINOTIFY
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

GuoPaiRequest = _reflection.GeneratedProtocolMessageType('GuoPaiRequest', (_message.Message,), dict(
  DESCRIPTOR = _GUOPAIREQUEST,
  __module__ = 'guo_pai_pb2'
  # @@protoc_insertion_point(class_scope:GuoPaiRequest)
  ))
_sym_db.RegisterMessage(GuoPaiRequest)

GuoPaiResponse = _reflection.GeneratedProtocolMessageType('GuoPaiResponse', (_message.Message,), dict(
  DESCRIPTOR = _GUOPAIRESPONSE,
  __module__ = 'guo_pai_pb2'
  # @@protoc_insertion_point(class_scope:GuoPaiResponse)
  ))
_sym_db.RegisterMessage(GuoPaiResponse)

GuoPaiNotify = _reflection.GeneratedProtocolMessageType('GuoPaiNotify', (_message.Message,), dict(
  DESCRIPTOR = _GUOPAINOTIFY,
  __module__ = 'guo_pai_pb2'
  # @@protoc_insertion_point(class_scope:GuoPaiNotify)
  ))
_sym_db.RegisterMessage(GuoPaiNotify)


# @@protoc_insertion_point(module_scope)
