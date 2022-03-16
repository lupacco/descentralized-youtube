pragma solidity >=0.4.21 <0.9.0;

//1. model dthe video [X]
//2. store the video [X]
//3. upload videoCount [X]
//4. list videos [X]

contract DVideo {
  uint public videoCount = 0;
  string public name = "DVideo";
  //2. Store the vídeos
  //key value store structs like a database asigning an id to each struct
  mapping(uint => Video) public videos;

  event VideoUploaded(
    uint id,
    string videoHash,
    string title,
    address author
  );

  //1. Model the vídeo
  struct Video{
    uint id;
    string videoHash;
    string title;
    address author;
  }

  //Create Struct


  //Create Event


  constructor() public {
  }

  function uploadVideo(string memory _videoHash, string memory _title) public {
    // Make sure the video hash exists
    require(bytes(_videoHash).length > 0);
    // Make sure video title exists
    require(bytes(_title).length > 0);
    // Make sure uploader address exists
    require(msg.sender != address(0));


    // Increment video id
    videoCount ++;
    // Add video to the contract
    videos[videoCount] = Video(videoCount, _videoHash, _title, msg.sender);

    // Trigger an event
    emit VideoUploaded(videoCount, _videoHash, _title, msg.sender);
  }
}
