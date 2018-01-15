%% Generated by the Erlang ASN.1 BER compiler. Version: 5.0.3
%% Purpose: Encoding and decoding of the types in CryptoConditions.

-module('CryptoConditions').
-compile(nowarn_unused_vars).
-dialyzer(no_improper_lists).
-include("CryptoConditions.hrl").
-asn1_info([{vsn,'5.0.3'},
            {module,'CryptoConditions'},
            {options,[der,verbose,{i,"."}]}]).

-export([encoding_rule/0,maps/0,bit_string_format/0,
         legacy_erlang_types/0]).
-export(['dialyzer-suppressions'/1]).
-export([
enc_Condition/2,
enc_SimpleSha256Condition/2,
enc_CompoundSha256Condition/2,
enc_ConditionTypes/2
]).

-export([
dec_Condition/2,
dec_SimpleSha256Condition/2,
dec_CompoundSha256Condition/2,
dec_ConditionTypes/2
]).

-export([info/0]).

-export([encode/2,decode/2]).

encoding_rule() -> der.

maps() -> false.

bit_string_format() -> bitstring.

legacy_erlang_types() -> false.

encode(Type, Data) ->
try iolist_to_binary(element(1, encode_disp(Type, Data))) of
  Bytes ->
    {ok,Bytes}
  catch
    Class:Exception when Class =:= error; Class =:= exit ->
      Stk = erlang:get_stacktrace(),
      case Exception of
        {error,{asn1,Reason}} ->
          {error,{asn1,{Reason,Stk}}};
        Reason ->
         {error,{asn1,{Reason,Stk}}}
      end
end.

decode(Type, Data) ->
try decode_disp(Type, element(1, ber_decode_nif(Data))) of
  Result ->
    {ok,Result}
  catch
    Class:Exception when Class =:= error; Class =:= exit ->
      Stk = erlang:get_stacktrace(),
      case Exception of
        {error,{asn1,Reason}} ->
          {error,{asn1,{Reason,Stk}}};
        Reason ->
         {error,{asn1,{Reason,Stk}}}
      end
end.

encode_disp('Condition', Data) -> enc_Condition(Data);
encode_disp('SimpleSha256Condition', Data) -> enc_SimpleSha256Condition(Data);
encode_disp('CompoundSha256Condition', Data) -> enc_CompoundSha256Condition(Data);
encode_disp('ConditionTypes', Data) -> enc_ConditionTypes(Data);
encode_disp(Type, _Data) -> exit({error,{asn1,{undefined_type,Type}}}).

decode_disp('Condition', Data) -> dec_Condition(Data);
decode_disp('SimpleSha256Condition', Data) -> dec_SimpleSha256Condition(Data);
decode_disp('CompoundSha256Condition', Data) -> dec_CompoundSha256Condition(Data);
decode_disp('ConditionTypes', Data) -> dec_ConditionTypes(Data);
decode_disp(Type, _Data) -> exit({error,{asn1,{undefined_type,Type}}}).

info() ->
   case ?MODULE:module_info(attributes) of
     Attributes when is_list(Attributes) ->
       case lists:keyfind(asn1_info, 1, Attributes) of
         {_,Info} when is_list(Info) ->
           Info;
         _ ->
           []
       end;
     _ ->
       []
   end.


%%================================
%%  Condition
%%================================
enc_Condition(Val) ->
    enc_Condition(Val, []).

enc_Condition(Val, TagIn) ->
   {EncBytes,EncLen} = case element(1,Val) of
      preimageSha256 ->
         'enc_SimpleSha256Condition'(element(2,Val), [<<160>>]);
      prefixSha256 ->
         'enc_CompoundSha256Condition'(element(2,Val), [<<161>>]);
      thresholdSha256 ->
         'enc_CompoundSha256Condition'(element(2,Val), [<<162>>]);
      rsaSha256 ->
         'enc_SimpleSha256Condition'(element(2,Val), [<<163>>]);
      ed25519Sha256 ->
         'enc_SimpleSha256Condition'(element(2,Val), [<<164>>]);
      Else -> 
         exit({error,{asn1,{invalid_choice_type,Else}}})
   end,

encode_tags(TagIn, EncBytes, EncLen).




dec_Condition(Tlv) ->
   dec_Condition(Tlv, []).

dec_Condition(Tlv, TagIn) ->
Tlv1 = match_tags(Tlv, TagIn),
case (case Tlv1 of [CtempTlv1] -> CtempTlv1; _ -> Tlv1 end) of

%% 'preimageSha256'
    {131072, V1} -> 
        {preimageSha256, 'dec_SimpleSha256Condition'(V1, [])};


%% 'prefixSha256'
    {131073, V1} -> 
        {prefixSha256, 'dec_CompoundSha256Condition'(V1, [])};


%% 'thresholdSha256'
    {131074, V1} -> 
        {thresholdSha256, 'dec_CompoundSha256Condition'(V1, [])};


%% 'rsaSha256'
    {131075, V1} -> 
        {rsaSha256, 'dec_SimpleSha256Condition'(V1, [])};


%% 'ed25519Sha256'
    {131076, V1} -> 
        {ed25519Sha256, 'dec_SimpleSha256Condition'(V1, [])};

      Else -> 
         exit({error,{asn1,{invalid_choice_tag,Else}}})
   end
.


%%================================
%%  SimpleSha256Condition
%%================================
enc_SimpleSha256Condition(Val) ->
    enc_SimpleSha256Condition(Val, [<<48>>]).

enc_SimpleSha256Condition(Val, TagIn) ->
{_,Cindex1,Cindex2} = Val,

%%-------------------------------------------------
%% attribute fingerprint(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute cost(2) with type INTEGER
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_integer(Cindex2, [<<129>>]),

   BytesSoFar = [EncBytes1, EncBytes2],
LenSoFar = EncLen1 + EncLen2,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_SimpleSha256Condition(Tlv) ->
   dec_SimpleSha256Condition(Tlv, [16]).

dec_SimpleSha256Condition(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute fingerprint(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = begin
Val1 = decode_octet_string(V1, [131072]),
C1 = byte_size(Val1),
if C1 =:= 32 ->
Val1;
true ->
exit({error,{asn1,bad_range}})
end
end,

%%-------------------------------------------------
%% attribute cost(2) with type INTEGER
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = begin
Val2 = decode_integer(V2, [131073]),
if 0 =< Val2, Val2 =< 4294967295 ->
Val2;
true ->
exit({error,{asn1,bad_range}})
end
end,

case Tlv3 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv3}}}) % extra fields not allowed
end,
Res1 = {'SimpleSha256Condition',Term1,Term2},
Res1.


%%================================
%%  CompoundSha256Condition
%%================================
enc_CompoundSha256Condition(Val) ->
    enc_CompoundSha256Condition(Val, [<<48>>]).

enc_CompoundSha256Condition(Val, TagIn) ->
{_,Cindex1,Cindex2,Cindex3} = Val,

%%-------------------------------------------------
%% attribute fingerprint(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute cost(2) with type INTEGER
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_integer(Cindex2, [<<129>>]),

%%-------------------------------------------------
%% attribute subtypes(3) with type BIT STRING
%%-------------------------------------------------
   {EncBytes3,EncLen3} = encode_named_bit_string(Cindex3, [{preImageSha256,0},{prefixSha256,1},{thresholdSha256,2},{rsaSha256,3},{ed25519Sha256,4}], [<<130>>]),

   BytesSoFar = [EncBytes1, EncBytes2, EncBytes3],
LenSoFar = EncLen1 + EncLen2 + EncLen3,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_CompoundSha256Condition(Tlv) ->
   dec_CompoundSha256Condition(Tlv, [16]).

dec_CompoundSha256Condition(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute fingerprint(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = begin
Val1 = decode_octet_string(V1, [131072]),
C1 = byte_size(Val1),
if C1 =:= 32 ->
Val1;
true ->
exit({error,{asn1,bad_range}})
end
end,

%%-------------------------------------------------
%% attribute cost(2) with type INTEGER
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = begin
Val2 = decode_integer(V2, [131073]),
if 0 =< Val2, Val2 =< 4294967295 ->
Val2;
true ->
exit({error,{asn1,bad_range}})
end
end,

%%-------------------------------------------------
%% attribute subtypes(3) with type BIT STRING
%%-------------------------------------------------
[V3|Tlv4] = Tlv3, 
Term3 = decode_named_bit_string(V3, [{preImageSha256,0},{prefixSha256,1},{thresholdSha256,2},{rsaSha256,3},{ed25519Sha256,4}], [131074]),

case Tlv4 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv4}}}) % extra fields not allowed
end,
Res1 = {'CompoundSha256Condition',Term1,Term2,Term3},
Res1.


%%================================
%%  ConditionTypes
%%================================
enc_ConditionTypes(Val) ->
    enc_ConditionTypes(Val, [<<3>>]).

enc_ConditionTypes(Val, TagIn) ->
encode_named_bit_string(Val, [{preImageSha256,0},{prefixSha256,1},{thresholdSha256,2},{rsaSha256,3},{ed25519Sha256,4}], TagIn).


dec_ConditionTypes(Tlv) ->
   dec_ConditionTypes(Tlv, [3]).

dec_ConditionTypes(Tlv, TagIn) ->
decode_named_bit_string(Tlv, [{preImageSha256,0},{prefixSha256,1},{thresholdSha256,2},{rsaSha256,3},{ed25519Sha256,4}], TagIn).


%%%
%%% Run-time functions.
%%%

'dialyzer-suppressions'(Arg) ->
    ok.

ber_decode_nif(B) ->
    asn1rt_nif:decode_ber_tlv(B).

collect_parts(TlvList) ->
    collect_parts(TlvList, []).

collect_parts([{_,L}|Rest], Acc) when is_list(L) ->
    collect_parts(Rest, [collect_parts(L)|Acc]);
collect_parts([{3,<<Unused,Bits/binary>>}|Rest], _Acc) ->
    collect_parts_bit(Rest, [Bits], Unused);
collect_parts([{_T,V}|Rest], Acc) ->
    collect_parts(Rest, [V|Acc]);
collect_parts([], Acc) ->
    list_to_binary(lists:reverse(Acc)).

collect_parts_bit([{3,<<Unused,Bits/binary>>}|Rest], Acc, Uacc) ->
    collect_parts_bit(Rest, [Bits|Acc], Unused + Uacc);
collect_parts_bit([], Acc, Uacc) ->
    list_to_binary([Uacc|lists:reverse(Acc)]).

decode_bitstring2(1,
                  Unused,
                  <<B7:1,B6:1,B5:1,B4:1,B3:1,B2:1,B1:1,B0:1,_/binary>>) ->
    lists:sublist([B7,B6,B5,B4,B3,B2,B1,B0], 8 - Unused);
decode_bitstring2(Len,
                  Unused,
                  <<B7:1,
                    B6:1,
                    B5:1,
                    B4:1,
                    B3:1,
                    B2:1,
                    B1:1,
                    B0:1,
                    Buffer/binary>>) ->
    [B7,B6,B5,B4,B3,B2,B1,B0|decode_bitstring2(Len - 1, Unused, Buffer)].

decode_bitstring_NNL(BitList, NamedNumberList) ->
    decode_bitstring_NNL(BitList, NamedNumberList, 0, []).

decode_bitstring_NNL([], _, _No, Result) ->
    lists:reverse(Result);
decode_bitstring_NNL([B|BitList],
                     [{Name,No}|NamedNumberList],
                     No,
                     Result) ->
    if
        B =:= 0 ->
            decode_bitstring_NNL(BitList,
                                 NamedNumberList,
                                 No + 1,
                                 Result);
        true ->
            decode_bitstring_NNL(BitList,
                                 NamedNumberList,
                                 No + 1,
                                 [Name|Result])
    end;
decode_bitstring_NNL([1|BitList], NamedNumberList, No, Result) ->
    decode_bitstring_NNL(BitList,
                         NamedNumberList,
                         No + 1,
                         [{bit,No}|Result]);
decode_bitstring_NNL([0|BitList], NamedNumberList, No, Result) ->
    decode_bitstring_NNL(BitList, NamedNumberList, No + 1, Result).

decode_integer(Tlv, TagIn) ->
    Bin = match_tags(Tlv, TagIn),
    Len = byte_size(Bin),
    <<Int:Len/signed-unit:8>> = Bin,
    Int.

decode_named_bit_string(Buffer, NamedNumberList, Tags) ->
    case match_and_collect(Buffer, Tags) of
        <<0>> ->
            [];
        <<Unused,Bits/binary>> ->
            BitString = decode_bitstring2(byte_size(Bits), Unused, Bits),
            decode_bitstring_NNL(BitString, NamedNumberList)
    end.

decode_octet_string(Tlv, TagsIn) ->
    Bin = match_and_collect(Tlv, TagsIn),
    binary:copy(Bin).

do_encode_named_bit_string([FirstVal|RestVal], NamedBitList, TagIn) ->
    ToSetPos = get_all_bitposes([FirstVal|RestVal], NamedBitList, []),
    Size = lists:max(ToSetPos) + 1,
    BitList = make_and_set_list(Size, ToSetPos, 0),
    {Len,Unused,OctetList} = encode_bitstring(BitList),
    encode_tags(TagIn, [Unused|OctetList], Len + 1).

encode_bitstring([B8,B7,B6,B5,B4,B3,B2,B1|Rest]) ->
    Val =
        B8 bsl 7 bor (B7 bsl 6) bor (B6 bsl 5) bor (B5 bsl 4)
        bor
        (B4 bsl 3)
        bor
        (B3 bsl 2)
        bor
        (B2 bsl 1)
        bor
        B1,
    encode_bitstring(Rest, [Val], 1);
encode_bitstring(Val) ->
    {Unused,Octet} = unused_bitlist(Val, 7, 0),
    {1,Unused,[Octet]}.

encode_bitstring([B8,B7,B6,B5,B4,B3,B2,B1|Rest], Ack, Len) ->
    Val =
        B8 bsl 7 bor (B7 bsl 6) bor (B6 bsl 5) bor (B5 bsl 4)
        bor
        (B4 bsl 3)
        bor
        (B3 bsl 2)
        bor
        (B2 bsl 1)
        bor
        B1,
    encode_bitstring(Rest, [Ack,Val], Len + 1);
encode_bitstring([], Ack, Len) ->
    {Len,0,Ack};
encode_bitstring(Rest, Ack, Len) ->
    {Unused,Val} = unused_bitlist(Rest, 7, 0),
    {Len + 1,Unused,[Ack,Val]}.

encode_integer(Val) ->
    Bytes =
        if
            Val >= 0 ->
                encode_integer_pos(Val, []);
            true ->
                encode_integer_neg(Val, [])
        end,
    {Bytes,length(Bytes)}.

encode_integer(Val, Tag) when is_integer(Val) ->
    encode_tags(Tag, encode_integer(Val));
encode_integer(Val, _Tag) ->
    exit({error,{asn1,{encode_integer,Val}}}).

encode_integer_neg(- 1, [B1|_T] = L) when B1 > 127 ->
    L;
encode_integer_neg(N, Acc) ->
    encode_integer_neg(N bsr 8, [N band 255|Acc]).

encode_integer_pos(0, [B|_Acc] = L) when B < 128 ->
    L;
encode_integer_pos(N, Acc) ->
    encode_integer_pos(N bsr 8, [N band 255|Acc]).

encode_length(L) when L =< 127 ->
    {[L],1};
encode_length(L) ->
    Oct = minimum_octets(L),
    Len = length(Oct),
    if
        Len =< 126 ->
            {[128 bor Len|Oct],Len + 1};
        true ->
            exit({error,{asn1,too_long_length_oct,Len}})
    end.

encode_named_bit_string([H|_] = Bits, NamedBitList, TagIn)
    when is_atom(H) ->
    do_encode_named_bit_string(Bits, NamedBitList, TagIn);
encode_named_bit_string([{bit,_}|_] = Bits, NamedBitList, TagIn) ->
    do_encode_named_bit_string(Bits, NamedBitList, TagIn);
encode_named_bit_string([], _NamedBitList, TagIn) ->
    encode_unnamed_bit_string(<<>>, TagIn);
encode_named_bit_string(Bits, _NamedBitList, TagIn)
    when is_bitstring(Bits) ->
    encode_unnamed_bit_string(Bits, TagIn).

encode_restricted_string(OctetList, TagIn) when is_binary(OctetList) ->
    encode_tags(TagIn, OctetList, byte_size(OctetList));
encode_restricted_string(OctetList, TagIn) when is_list(OctetList) ->
    encode_tags(TagIn, OctetList, length(OctetList)).

encode_tags(TagIn, {BytesSoFar,LenSoFar}) ->
    encode_tags(TagIn, BytesSoFar, LenSoFar).

encode_tags([Tag|Trest], BytesSoFar, LenSoFar) ->
    {Bytes2,L2} = encode_length(LenSoFar),
    encode_tags(Trest,
                [Tag,Bytes2|BytesSoFar],
                LenSoFar + byte_size(Tag) + L2);
encode_tags([], BytesSoFar, LenSoFar) ->
    {BytesSoFar,LenSoFar}.

encode_unnamed_bit_string(Bits, TagIn) ->
    Unused = (8 - bit_size(Bits) band 7) band 7,
    Bin = <<Unused,Bits/bitstring,0:Unused>>,
    encode_tags(TagIn, Bin, byte_size(Bin)).

get_all_bitposes([{bit,ValPos}|Rest], NamedBitList, Ack) ->
    get_all_bitposes(Rest, NamedBitList, [ValPos|Ack]);
get_all_bitposes([Val|Rest], NamedBitList, Ack) when is_atom(Val) ->
    case lists:keyfind(Val, 1, NamedBitList) of
        {_ValName,ValPos} ->
            get_all_bitposes(Rest, NamedBitList, [ValPos|Ack]);
        _ ->
            exit({error,{asn1,{bitstring_namedbit,Val}}})
    end;
get_all_bitposes([], _NamedBitList, Ack) ->
    lists:sort(Ack).

make_and_set_list(0, [], _) ->
    [];
make_and_set_list(0, _, _) ->
    exit({error,{asn1,bitstring_sizeconstraint}});
make_and_set_list(Len, [XPos|SetPos], XPos) ->
    [1|make_and_set_list(Len - 1, SetPos, XPos + 1)];
make_and_set_list(Len, [Pos|SetPos], XPos) ->
    [0|make_and_set_list(Len - 1, [Pos|SetPos], XPos + 1)];
make_and_set_list(Len, [], XPos) ->
    [0|make_and_set_list(Len - 1, [], XPos + 1)].

match_and_collect(Tlv, TagsIn) ->
    Val = match_tags(Tlv, TagsIn),
    case Val of
        [_|_] = PartList ->
            collect_parts(PartList);
        Bin when is_binary(Bin) ->
            Bin
    end.

match_tags({T,V}, [T]) ->
    V;
match_tags({T,V}, [T|Tt]) ->
    match_tags(V, Tt);
match_tags([{T,V}], [T|Tt]) ->
    match_tags(V, Tt);
match_tags([{T,_V}|_] = Vlist, [T]) ->
    Vlist;
match_tags(Tlv, []) ->
    Tlv;
match_tags({Tag,_V} = Tlv, [T|_Tt]) ->
    exit({error,{asn1,{wrong_tag,{{expected,T},{got,Tag,Tlv}}}}}).

minimum_octets(0, Acc) ->
    Acc;
minimum_octets(Val, Acc) ->
    minimum_octets(Val bsr 8, [Val band 255|Acc]).

minimum_octets(Val) ->
    minimum_octets(Val, []).

unused_bitlist([], Trail, Ack) ->
    {Trail + 1,Ack};
unused_bitlist([Bit|Rest], Trail, Ack) ->
    unused_bitlist(Rest, Trail - 1, Bit bsl Trail bor Ack).
