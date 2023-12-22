# frozen_string_literal: true

module Nostr
  # Defines the event kinds that can be emitted by clients.
  module EventKind
    # The content is set to a stringified JSON object +{name: <username>, about: <string>,
    # picture: <url, string>}+ describing the user who created the event. A relay may delete past set_metadata
    # events once it gets a new one for the same pubkey.
    #
    # @return [Integer]
    #
    SET_METADATA = 0

    # The content is set to the text content of a note (anything the user wants to say).
    # Non-plaintext notes should instead use kind 1000-10000 as described in NIP-16.
    #
    # @return [Integer]
    #
    TEXT_NOTE = 1

    # The content is set to the URL (e.g., wss://somerelay.com) of a relay the event creator wants to
    # recommend to its followers.
    #
    # @deprecated This event kind was removed in https://github.com/nostr-protocol/nips/pull/703/files#diff-39307f1617417657ee9874be314f13aabdc74401b124d0afe8217f2919c9c7d8L105
    # @return [Integer]
    #
    RECOMMEND_SERVER = 2

    # A special event with kind 3, meaning "contact list" is defined as having a list of p tags, one for each of
    # the followed/known profiles one is following.
    #
    # @return [Integer]
    #
    CONTACT_LIST = 3

    # A special event with kind 4, meaning "encrypted direct message". An event of this kind has its +content+
    # equal to the base64-encoded, aes-256-cbc encrypted string of anything a user wants to write, encrypted using a
    # shared cipher generated by combining the recipient's public-key with the sender's private-key.
    #
    # @return [Integer]
    #
    ENCRYPTED_DIRECT_MESSAGE = 4
  end
end
