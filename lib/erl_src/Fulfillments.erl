%% Generated by the Erlang ASN.1 BER compiler. Version: 5.0.4
%% Purpose: Encoding and decoding of the types in Fulfillments.

-module('Fulfillments').
-compile(nowarn_unused_vars).
-dialyzer(no_improper_lists).
-include("Fulfillments.hrl").
-asn1_info([{vsn,'5.0.4'},
            {module,'Fulfillments'},
            {options,[ber,der,{i,"."}]}]).

-export([encoding_rule/0,maps/0,bit_string_format/0,
         legacy_erlang_types/0]).
-export(['dialyzer-suppressions'/1]).
-export([
enc_Fulfillment/2,
enc_PreimageFulfillment/2,
enc_PrefixFulfillment/2,
enc_ThresholdFulfillment/2,
enc_RsaSha256Fulfillment/2,
enc_Ed25519Sha512Fulfillment/2
]).

-export([
dec_Fulfillment/2,
dec_PreimageFulfillment/2,
dec_PrefixFulfillment/2,
dec_ThresholdFulfillment/2,
dec_RsaSha256Fulfillment/2,
dec_Ed25519Sha512Fulfillment/2
]).

-export([info/0]).

-export([encode/2,decode/2]).

encoding_rule() -> ber.

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
try
   Result = decode_disp(Type, element(1, ber_decode_nif(Data))),
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

encode_disp('Fulfillment', Data) -> enc_Fulfillment(Data);
encode_disp('PreimageFulfillment', Data) -> enc_PreimageFulfillment(Data);
encode_disp('PrefixFulfillment', Data) -> enc_PrefixFulfillment(Data);
encode_disp('ThresholdFulfillment', Data) -> enc_ThresholdFulfillment(Data);
encode_disp('RsaSha256Fulfillment', Data) -> enc_RsaSha256Fulfillment(Data);
encode_disp('Ed25519Sha512Fulfillment', Data) -> enc_Ed25519Sha512Fulfillment(Data);
encode_disp(Type, _Data) -> exit({error,{asn1,{undefined_type,Type}}}).

decode_disp('Fulfillment', Data) -> dec_Fulfillment(Data);
decode_disp('PreimageFulfillment', Data) -> dec_PreimageFulfillment(Data);
decode_disp('PrefixFulfillment', Data) -> dec_PrefixFulfillment(Data);
decode_disp('ThresholdFulfillment', Data) -> dec_ThresholdFulfillment(Data);
decode_disp('RsaSha256Fulfillment', Data) -> dec_RsaSha256Fulfillment(Data);
decode_disp('Ed25519Sha512Fulfillment', Data) -> dec_Ed25519Sha512Fulfillment(Data);
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
%%  Fulfillment
%%================================
enc_Fulfillment(Val) ->
    enc_Fulfillment(Val, []).

enc_Fulfillment(Val, TagIn) ->
   {EncBytes,EncLen} = case element(1,Val) of
      preimageSha256 ->
         'enc_PreimageFulfillment'(element(2,Val), [<<160>>]);
      prefixSha256 ->
         'enc_PrefixFulfillment'(element(2,Val), [<<161>>]);
      thresholdSha256 ->
         'enc_ThresholdFulfillment'(element(2,Val), [<<162>>]);
      rsaSha256 ->
         'enc_RsaSha256Fulfillment'(element(2,Val), [<<163>>]);
      ed25519Sha256 ->
         'enc_Ed25519Sha512Fulfillment'(element(2,Val), [<<164>>]);
      Else -> 
         exit({error,{asn1,{invalid_choice_type,Else}}})
   end,

encode_tags(TagIn, EncBytes, EncLen).




dec_Fulfillment(Tlv) ->
   dec_Fulfillment(Tlv, []).

dec_Fulfillment(Tlv, TagIn) ->
Tlv1 = match_tags(Tlv, TagIn),
case (case Tlv1 of [CtempTlv1] -> CtempTlv1; _ -> Tlv1 end) of

%% 'preimageSha256'
    {131072, V1} -> 
        {preimageSha256, 'dec_PreimageFulfillment'(V1, [])};


%% 'prefixSha256'
    {131073, V1} -> 
        {prefixSha256, 'dec_PrefixFulfillment'(V1, [])};


%% 'thresholdSha256'
    {131074, V1} -> 
        {thresholdSha256, 'dec_ThresholdFulfillment'(V1, [])};


%% 'rsaSha256'
    {131075, V1} -> 
        {rsaSha256, 'dec_RsaSha256Fulfillment'(V1, [])};


%% 'ed25519Sha256'
    {131076, V1} -> 
        {ed25519Sha256, 'dec_Ed25519Sha512Fulfillment'(V1, [])};

      Else -> 
         exit({error,{asn1,{invalid_choice_tag,Else}}})
   end
.


%%================================
%%  PreimageFulfillment
%%================================
enc_PreimageFulfillment(Val) ->
    enc_PreimageFulfillment(Val, [<<48>>]).

enc_PreimageFulfillment(Val, TagIn) ->
{_,Cindex1} = Val,

%%-------------------------------------------------
%% attribute preimage(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

   BytesSoFar = [EncBytes1],
LenSoFar = EncLen1,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_PreimageFulfillment(Tlv) ->
   dec_PreimageFulfillment(Tlv, [16]).

dec_PreimageFulfillment(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute preimage(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = decode_octet_string(V1, [131072]),

case Tlv2 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv2}}}) % extra fields not allowed
end,
Res1 = {'PreimageFulfillment',Term1},
Res1.


%%================================
%%  PrefixFulfillment
%%================================
enc_PrefixFulfillment(Val) ->
    enc_PrefixFulfillment(Val, [<<48>>]).

enc_PrefixFulfillment(Val, TagIn) ->
{_,Cindex1,Cindex2,Cindex3} = Val,

%%-------------------------------------------------
%% attribute prefix(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute maxMessageLength(2) with type INTEGER
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_integer(Cindex2, [<<129>>]),

%%-------------------------------------------------
%% attribute subfulfillment(3)   External Fulfillments:Fulfillment
%%-------------------------------------------------
   {EncBytes3,EncLen3} = 'enc_Fulfillment'(Cindex3, [<<162>>]),

   BytesSoFar = [EncBytes1, EncBytes2, EncBytes3],
LenSoFar = EncLen1 + EncLen2 + EncLen3,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_PrefixFulfillment(Tlv) ->
   dec_PrefixFulfillment(Tlv, [16]).

dec_PrefixFulfillment(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute prefix(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = decode_octet_string(V1, [131072]),

%%-------------------------------------------------
%% attribute maxMessageLength(2) with type INTEGER
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = begin
Val1 = decode_integer(V2, [131073]),
if 0 =< Val1, Val1 =< 4294967295 ->
Val1;
true ->
exit({error,{asn1,bad_range}})
end
end,

%%-------------------------------------------------
%% attribute subfulfillment(3)   External Fulfillments:Fulfillment
%%-------------------------------------------------
[V3|Tlv4] = Tlv3, 
Term3 = 'dec_Fulfillment'(V3, [131074]),

case Tlv4 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv4}}}) % extra fields not allowed
end,
Res1 = {'PrefixFulfillment',Term1,Term2,Term3},
Res1.


%%================================
%%  ThresholdFulfillment
%%================================
enc_ThresholdFulfillment(Val) ->
    enc_ThresholdFulfillment(Val, [<<48>>]).

enc_ThresholdFulfillment(Val, TagIn) ->
{_,Cindex1,Cindex2} = Val,

%%-------------------------------------------------
%% attribute subfulfillments(1) with type SET OF
%%-------------------------------------------------
   {EncBytes1,EncLen1} = 'enc_ThresholdFulfillment_subfulfillments'(Cindex1, [<<160>>]),

%%-------------------------------------------------
%% attribute subconditions(2) with type SET OF
%%-------------------------------------------------
   {EncBytes2,EncLen2} = 'enc_ThresholdFulfillment_subconditions'(Cindex2, [<<161>>]),

   BytesSoFar = [EncBytes1, EncBytes2],
LenSoFar = EncLen1 + EncLen2,
encode_tags(TagIn, BytesSoFar, LenSoFar).



%%================================
%%  ThresholdFulfillment_subfulfillments
%%================================
enc_ThresholdFulfillment_subfulfillments(Val, TagIn) ->
      {EncBytes,EncLen} = 'enc_ThresholdFulfillment_subfulfillments_components'(Val,[],0),
   encode_tags(TagIn, EncBytes, EncLen).

'enc_ThresholdFulfillment_subfulfillments_components'([], AccBytes, AccLen) -> 
   {dynamicsort_SETOF(AccBytes),AccLen};

'enc_ThresholdFulfillment_subfulfillments_components'([H|T],AccBytes, AccLen) ->
   {EncBytes,EncLen} = 'enc_Fulfillment'(H, []),
   'enc_ThresholdFulfillment_subfulfillments_components'(T,[EncBytes|AccBytes], AccLen + EncLen).




%%================================
%%  ThresholdFulfillment_subconditions
%%================================
enc_ThresholdFulfillment_subconditions(Val, TagIn) ->
      {EncBytes,EncLen} = 'enc_ThresholdFulfillment_subconditions_components'(Val,[],0),
   encode_tags(TagIn, EncBytes, EncLen).

'enc_ThresholdFulfillment_subconditions_components'([], AccBytes, AccLen) -> 
   {dynamicsort_SETOF(AccBytes),AccLen};

'enc_ThresholdFulfillment_subconditions_components'([H|T],AccBytes, AccLen) ->
   {EncBytes,EncLen} = 'CryptoConditions':'enc_Condition'(H, []),
   'enc_ThresholdFulfillment_subconditions_components'(T,[EncBytes|AccBytes], AccLen + EncLen).



dec_ThresholdFulfillment(Tlv) ->
   dec_ThresholdFulfillment(Tlv, [16]).

dec_ThresholdFulfillment(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute subfulfillments(1) with type SET OF
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = 'dec_ThresholdFulfillment_subfulfillments'(V1, [131072]),

%%-------------------------------------------------
%% attribute subconditions(2) with type SET OF
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = 'dec_ThresholdFulfillment_subconditions'(V2, [131073]),

case Tlv3 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv3}}}) % extra fields not allowed
end,
Res1 = {'ThresholdFulfillment',Term1,Term2},
Res1.
'dec_ThresholdFulfillment_subfulfillments'(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),
['dec_Fulfillment'(V1, []) || V1 <- Tlv1].


'dec_ThresholdFulfillment_subconditions'(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),
['CryptoConditions':'dec_Condition'(V1, []) || V1 <- Tlv1].




%%================================
%%  RsaSha256Fulfillment
%%================================
enc_RsaSha256Fulfillment(Val) ->
    enc_RsaSha256Fulfillment(Val, [<<48>>]).

enc_RsaSha256Fulfillment(Val, TagIn) ->
{_,Cindex1,Cindex2} = Val,

%%-------------------------------------------------
%% attribute modulus(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute signature(2) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_restricted_string(Cindex2, [<<129>>]),

   BytesSoFar = [EncBytes1, EncBytes2],
LenSoFar = EncLen1 + EncLen2,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_RsaSha256Fulfillment(Tlv) ->
   dec_RsaSha256Fulfillment(Tlv, [16]).

dec_RsaSha256Fulfillment(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute modulus(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = decode_octet_string(V1, [131072]),

%%-------------------------------------------------
%% attribute signature(2) with type OCTET STRING
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = decode_octet_string(V2, [131073]),

case Tlv3 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv3}}}) % extra fields not allowed
end,
Res1 = {'RsaSha256Fulfillment',Term1,Term2},
Res1.


%%================================
%%  Ed25519Sha512Fulfillment
%%================================
enc_Ed25519Sha512Fulfillment(Val) ->
    enc_Ed25519Sha512Fulfillment(Val, [<<48>>]).

enc_Ed25519Sha512Fulfillment(Val, TagIn) ->
{_,Cindex1,Cindex2} = Val,

%%-------------------------------------------------
%% attribute publicKey(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute signature(2) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_restricted_string(Cindex2, [<<129>>]),

   BytesSoFar = [EncBytes1, EncBytes2],
LenSoFar = EncLen1 + EncLen2,
encode_tags(TagIn, BytesSoFar, LenSoFar).


dec_Ed25519Sha512Fulfillment(Tlv) ->
   dec_Ed25519Sha512Fulfillment(Tlv, [16]).

dec_Ed25519Sha512Fulfillment(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute publicKey(1) with type OCTET STRING
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
%% attribute signature(2) with type OCTET STRING
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = begin
Val2 = decode_octet_string(V2, [131073]),
C2 = byte_size(Val2),
if C2 =:= 64 ->
Val2;
true ->
exit({error,{asn1,bad_range}})
end
end,

case Tlv3 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv3}}}) % extra fields not allowed
end,
Res1 = {'Ed25519Sha512Fulfillment',Term1,Term2},
Res1.

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

decode_integer(Tlv, TagIn) ->
    Bin = match_tags(Tlv, TagIn),
    Len = byte_size(Bin),
    <<Int:Len/signed-unit:8>> = Bin,
    Int.

decode_octet_string(Tlv, TagsIn) ->
    Bin = match_and_collect(Tlv, TagsIn),
    binary:copy(Bin).

dynamicsort_SETOF(ListOfEncVal) ->
    BinL =
        lists:map(fun(L) when is_list(L) ->
                         list_to_binary(L);
                     (B) ->
                         B
                  end,
                  ListOfEncVal),
    lists:sort(BinL).

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
