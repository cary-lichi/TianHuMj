# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: rookie.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
from google.protobuf import descriptor_pb2
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


import assets_pb2 as assets__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='rookie.proto',
  package='',
  syntax='proto2',
  serialized_pb=_b('\n\x0crookie.proto\x1a\x0c\x61ssets.proto\"G\n\x0cRookieRecord\x12\x0f\n\x07nUserID\x18\x01 \x02(\x05\x12\x11\n\tnUserNick\x18\x02 \x02(\t\x12\x13\n\x0bnInviteTime\x18\x03 \x02(\x05\"0\n\rRookieRequest\x12\x0f\n\x07nUserID\x18\x01 \x02(\x05\x12\x0e\n\x06sICode\x18\x02 \x02(\t\"E\n\x0eRookieResponse\x12\x12\n\nnErrorCode\x18\x01 \x02(\x05\x12\x1f\n\tnewAssets\x18\x02 \x02(\x0b\x32\x0c.AssetUpdate\"2\n\x0eIRookieRequest\x12\x0f\n\x07nUserID\x18\x01 \x02(\x05\x12\x0f\n\x07nAwards\x18\x02 \x02(\x05\"F\n\x0fIRookieResponse\x12\x12\n\nnErrorCode\x18\x01 \x02(\x05\x12\x1f\n\tnewAssets\x18\x02 \x02(\x0b\x32\x0c.AssetUpdate\"%\n\x12IRookieShowRequest\x12\x0f\n\x07nUserID\x18\x01 \x02(\x05\"^\n\x13IRookieShowResponse\x12\x12\n\nnErrorCode\x18\x01 \x02(\x05\x12\x13\n\x0bnAwardCount\x18\x02 \x02(\x05\x12\x1e\n\x07records\x18\x03 \x03(\x0b\x32\r.RookieRecord')
  ,
  dependencies=[assets__pb2.DESCRIPTOR,])




_ROOKIERECORD = _descriptor.Descriptor(
  name='RookieRecord',
  full_name='RookieRecord',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nUserID', full_name='RookieRecord.nUserID', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='nUserNick', full_name='RookieRecord.nUserNick', index=1,
      number=2, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='nInviteTime', full_name='RookieRecord.nInviteTime', index=2,
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
  serialized_start=30,
  serialized_end=101,
)


_ROOKIEREQUEST = _descriptor.Descriptor(
  name='RookieRequest',
  full_name='RookieRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nUserID', full_name='RookieRequest.nUserID', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='sICode', full_name='RookieRequest.sICode', index=1,
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
  serialized_start=103,
  serialized_end=151,
)


_ROOKIERESPONSE = _descriptor.Descriptor(
  name='RookieResponse',
  full_name='RookieResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nErrorCode', full_name='RookieResponse.nErrorCode', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='newAssets', full_name='RookieResponse.newAssets', index=1,
      number=2, type=11, cpp_type=10, label=2,
      has_default_value=False, default_value=None,
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
  serialized_start=153,
  serialized_end=222,
)


_IROOKIEREQUEST = _descriptor.Descriptor(
  name='IRookieRequest',
  full_name='IRookieRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nUserID', full_name='IRookieRequest.nUserID', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='nAwards', full_name='IRookieRequest.nAwards', index=1,
      number=2, type=5, cpp_type=1, label=2,
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
  serialized_start=224,
  serialized_end=274,
)


_IROOKIERESPONSE = _descriptor.Descriptor(
  name='IRookieResponse',
  full_name='IRookieResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nErrorCode', full_name='IRookieResponse.nErrorCode', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='newAssets', full_name='IRookieResponse.newAssets', index=1,
      number=2, type=11, cpp_type=10, label=2,
      has_default_value=False, default_value=None,
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
  serialized_start=276,
  serialized_end=346,
)


_IROOKIESHOWREQUEST = _descriptor.Descriptor(
  name='IRookieShowRequest',
  full_name='IRookieShowRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nUserID', full_name='IRookieShowRequest.nUserID', index=0,
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
  serialized_start=348,
  serialized_end=385,
)


_IROOKIESHOWRESPONSE = _descriptor.Descriptor(
  name='IRookieShowResponse',
  full_name='IRookieShowResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='nErrorCode', full_name='IRookieShowResponse.nErrorCode', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='nAwardCount', full_name='IRookieShowResponse.nAwardCount', index=1,
      number=2, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='records', full_name='IRookieShowResponse.records', index=2,
      number=3, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
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
  serialized_start=387,
  serialized_end=481,
)

_ROOKIERESPONSE.fields_by_name['newAssets'].message_type = assets__pb2._ASSETUPDATE
_IROOKIERESPONSE.fields_by_name['newAssets'].message_type = assets__pb2._ASSETUPDATE
_IROOKIESHOWRESPONSE.fields_by_name['records'].message_type = _ROOKIERECORD
DESCRIPTOR.message_types_by_name['RookieRecord'] = _ROOKIERECORD
DESCRIPTOR.message_types_by_name['RookieRequest'] = _ROOKIEREQUEST
DESCRIPTOR.message_types_by_name['RookieResponse'] = _ROOKIERESPONSE
DESCRIPTOR.message_types_by_name['IRookieRequest'] = _IROOKIEREQUEST
DESCRIPTOR.message_types_by_name['IRookieResponse'] = _IROOKIERESPONSE
DESCRIPTOR.message_types_by_name['IRookieShowRequest'] = _IROOKIESHOWREQUEST
DESCRIPTOR.message_types_by_name['IRookieShowResponse'] = _IROOKIESHOWRESPONSE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

RookieRecord = _reflection.GeneratedProtocolMessageType('RookieRecord', (_message.Message,), dict(
  DESCRIPTOR = _ROOKIERECORD,
  __module__ = 'rookie_pb2'
  # @@protoc_insertion_point(class_scope:RookieRecord)
  ))
_sym_db.RegisterMessage(RookieRecord)

RookieRequest = _reflection.GeneratedProtocolMessageType('RookieRequest', (_message.Message,), dict(
  DESCRIPTOR = _ROOKIEREQUEST,
  __module__ = 'rookie_pb2'
  # @@protoc_insertion_point(class_scope:RookieRequest)
  ))
_sym_db.RegisterMessage(RookieRequest)

RookieResponse = _reflection.GeneratedProtocolMessageType('RookieResponse', (_message.Message,), dict(
  DESCRIPTOR = _ROOKIERESPONSE,
  __module__ = 'rookie_pb2'
  # @@protoc_insertion_point(class_scope:RookieResponse)
  ))
_sym_db.RegisterMessage(RookieResponse)

IRookieRequest = _reflection.GeneratedProtocolMessageType('IRookieRequest', (_message.Message,), dict(
  DESCRIPTOR = _IROOKIEREQUEST,
  __module__ = 'rookie_pb2'
  # @@protoc_insertion_point(class_scope:IRookieRequest)
  ))
_sym_db.RegisterMessage(IRookieRequest)

IRookieResponse = _reflection.GeneratedProtocolMessageType('IRookieResponse', (_message.Message,), dict(
  DESCRIPTOR = _IROOKIERESPONSE,
  __module__ = 'rookie_pb2'
  # @@protoc_insertion_point(class_scope:IRookieResponse)
  ))
_sym_db.RegisterMessage(IRookieResponse)

IRookieShowRequest = _reflection.GeneratedProtocolMessageType('IRookieShowRequest', (_message.Message,), dict(
  DESCRIPTOR = _IROOKIESHOWREQUEST,
  __module__ = 'rookie_pb2'
  # @@protoc_insertion_point(class_scope:IRookieShowRequest)
  ))
_sym_db.RegisterMessage(IRookieShowRequest)

IRookieShowResponse = _reflection.GeneratedProtocolMessageType('IRookieShowResponse', (_message.Message,), dict(
  DESCRIPTOR = _IROOKIESHOWRESPONSE,
  __module__ = 'rookie_pb2'
  # @@protoc_insertion_point(class_scope:IRookieShowResponse)
  ))
_sym_db.RegisterMessage(IRookieShowResponse)


# @@protoc_insertion_point(module_scope)
