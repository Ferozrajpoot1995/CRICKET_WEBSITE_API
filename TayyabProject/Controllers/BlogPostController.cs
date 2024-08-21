using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TayyabProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogPostController : ControllerBase
    {
        private readonly TayyabProjectContext _context;

        public BlogPostController(TayyabProjectContext context)
        {
            _context = context;
        }
        // GET: api/<MatchController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BlogPost>>> GetBlogPost()
        {
            return await _context.BlogPosts.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<BlogPost>> GetBlogPostById(int id)
        {
            var blogPost = await _context.BlogPosts.FindAsync(id);

            if (blogPost == null)
            {
                return NotFound(); // Return 404 if not found
            }

            return Ok(blogPost); // Return 200 OK with the blog post data
        }
        // POST api/<MatchController>
        [HttpPost]
        public async Task<ActionResult<Player>> PostBlog(BlogPost post)
        {
            _context.BlogPosts.Add(post);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBlogPost", new { id = post.Id }, post);
        }

        // PUT: api/Players/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBlog(int id, BlogPost post)
        {
            if (id != post.Id)
            {
                return BadRequest();
            }

            _context.Entry(post).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!matchexist(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // DELETE: api/Players/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Deletepost(int id)
        {
            var blog = await _context.BlogPosts.FindAsync(id);
            if (blog == null)
            {
                return NotFound();
            }

            _context.BlogPosts.Remove(blog);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool matchexist(int id)
        {
            return _context.BlogPosts.Any(e => e.Id == id);
        }
    }
}
