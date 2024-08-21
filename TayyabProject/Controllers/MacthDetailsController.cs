using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TayyabProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MacthDetailsController : ControllerBase
    {

        private readonly TayyabProjectContext _context;

        public MacthDetailsController(TayyabProjectContext context)
        {
            _context = context;
        }
        // GET: api/<MacthDetailsController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MatchDetails>>> GetMatchDetails()
        {
            var matchDetails = await _context.Matches
        .Join(_context.Teams,
              m => m.HomeTeamId,
              ht => ht.TeamId,
              (m, ht) => new { m, ht })
        .Join(_context.Teams,
              combined => combined.m.AwayTeamId,
              at => at.TeamId,
              (combined, at) => new MatchDetails
              {
                  MatchId = combined.m.MatchId,
                  HomeTeamScore = combined.m.HomeTeamScore,
                  AwayTeamScore = combined.m.AwayTeamScore,
                  HomeTeamName = combined.ht.TeamName,
                  AwayTeamName = at.TeamName,
                  MatchDate = combined.m.MatchDate,
                  Venue = combined.m.Venue,
                  ResultMessage = combined.m.AwayTeamScore > combined.m.HomeTeamScore
                                  ? $"{at.TeamName} team won by {combined.m.AwayTeamScore - combined.m.HomeTeamScore} runs"
                                  : $"{combined.ht.TeamName} team won by {combined.m.HomeTeamScore - combined.m.AwayTeamScore} runs"
              })
        .ToListAsync();

            return Ok(matchDetails);
        }

        // GET api/<MacthDetailsController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MatchDetailsInformation>> GetMatchId(int id)
        {
            var matchQuery = _context.Matches
    .Where(m => m.MatchId == id)
    .Select(m => new
    {
        m.MatchId,
        m.HomeTeamId,
        m.AwayTeamId,
        m.HomeTeamScore,
        m.AwayTeamScore,
        m.MatchDate,
        m.Venue,
        HomeTeam = _context.Teams.FirstOrDefault(ht => ht.TeamId == m.HomeTeamId),
        AwayTeam = _context.Teams.FirstOrDefault(at => at.TeamId == m.AwayTeamId)
    });

            var players = _context.Players
    .ToList();

            var matchDetails = matchQuery
    .AsEnumerable() // Switch to client-side processing
    .Select(m => new
    {
        m.MatchId,
        HomeTeamName = m.HomeTeam?.TeamName,
        AwayTeamName = m.AwayTeam?.TeamName,
        m.HomeTeamScore,
        m.AwayTeamScore,
        m.MatchDate,
        m.Venue,
        HomePlayers = players.Where(p => p.TeamId == m.HomeTeamId)
            .OrderBy(p => p.Position)
            .Select(p => new
            {
                p.PlayerName,
                p.JerseyNumber,
                p.Position
            })
            .ToList(),
        AwayPlayers = players.Where(p => p.TeamId == m.AwayTeamId)
            .OrderBy(p => p.Position)
            .Select(p => new
            {
                p.PlayerName,
                p.JerseyNumber,
                p.Position
            })
            .ToList(),
        ResultMessage = m.AwayTeamScore > m.HomeTeamScore
            ? $"{m.AwayTeam?.TeamName} team won by {m.AwayTeamScore - m.HomeTeamScore} runs"
            : $"{m.HomeTeam?.TeamName} team won by {m.HomeTeamScore - m.AwayTeamScore} runs"
    })
    .FirstOrDefault();

            return Ok( matchDetails);
        }

        // POST api/<MacthDetailsController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<MacthDetailsController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<MacthDetailsController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
