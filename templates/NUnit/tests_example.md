```cs
// Download game
[TestCase("download-btn", "pretend-modal")]
// Screen image
[TestCase("screen-01", "screen-modal")]
// // Top player on the leaderboard
[TestCase("profile-1", "profile-modal-1")]
public void ClickLinkById_ShouldDisplayModalById(string linkId, string modalId)
{

...
```