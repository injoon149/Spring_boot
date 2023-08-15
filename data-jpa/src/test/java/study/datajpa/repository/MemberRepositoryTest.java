package study.datajpa.repository;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import study.datajpa.domain.Member;
import study.datajpa.domain.Team;
import study.datajpa.dto.MemberDto;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@SpringBootTest
@Transactional
@Rollback(value = false)
public class MemberRepositoryTest {
    @Autowired
    MemberRepository memberRepository;

    @PersistenceContext
    EntityManager em;

    @Test
    public void testMember() {
        Member member = new Member("memberA");
        Member savedMember = memberRepository.save(member);

        Member findMember = memberRepository.findById(savedMember.getId()).get();
        Assertions.assertThat(member.getId()).isEqualTo(findMember.getId());
        Assertions.assertThat(member.getUsername()).isEqualTo(findMember.getUsername());
        Assertions.assertThat(member).isEqualTo(findMember);
    }

    @Test
    public void testMemberName() {
        Member member = new Member("memberA", 100);
        Member savedMember =  memberRepository.save(member);
        Member findMember = memberRepository.findByUsername(savedMember.getUsername()).get(0);
        Assertions.assertThat(member.getId()).isEqualTo(findMember.getId());
        Assertions.assertThat(member.getUsername()).isEqualTo(findMember.getUsername());
        Assertions.assertThat(member).isEqualTo(findMember);

    }

    @Test
    public void testFindusernameList() {
        Team team1 = new Team("red");
        Team team2 = new Team("blue");
        em.persist(team1);
        em.persist(team2);
        Member member1 = new Member("memberA", 100, team1);
        Member member2 = new Member("memberB", 12, team2);


        memberRepository.save(member1);
        memberRepository.save(member2);
        List<String> memberList = memberRepository.findUsernameList();
        Assertions.assertThat(memberList.get(0)).isEqualTo("memberA");
        Assertions.assertThat(memberList.size()).isEqualTo(2);
        Assertions.assertThat(memberList.get(1)).isEqualTo("memberB");
    }
    @Test
    public void testFindMemberDto() {
        Team team1 = new Team("red");
        Team team2 = new Team("blue");
        em.persist(team1);
        em.persist(team2);
        Member member1 = new Member("memberA", 100, team1);
        Member member2 = new Member("memberB", 12, team2);
        memberRepository.save(member1);
        memberRepository.save(member2);
        List<MemberDto> memberDtoList = memberRepository.findMemberDto();
        for (MemberDto memberDto : memberDtoList) {
            System.out.println("memberDto = " + memberDto);
        }
    }

    @Test
    public void page() throws Exception {
        //given
        memberRepository.save(new Member("member1", 10));
        memberRepository.save(new Member("member2", 10));
        memberRepository.save(new Member("member3", 10));
        memberRepository.save(new Member("member4", 10));
        memberRepository.save(new Member("member5", 10));

        //when
        PageRequest pageRequest = PageRequest.of(0,3, Sort.by(Sort.Direction.DESC, "username"));
        Page<Member> page2 = memberRepository.findByAge(10, pageRequest);
        Page<MemberDto> page = page2.map(member -> new MemberDto(member.getId(),
                member.getUsername(), null) );

        //then
        List<MemberDto> content = page.getContent(); //조회된 데이터
        Assertions.assertThat(content.size()).isEqualTo(3); //조회된 데이터 수
        Assertions.assertThat(page.getTotalElements()).isEqualTo(5); //전체 데이터 수
        Assertions.assertThat(page.getNumber()).isEqualTo(0); //페이지 번호
        Assertions.assertThat(page.getTotalPages()).isEqualTo(2); //전체 페이지 수
        Assertions.assertThat(page.isFirst()).isTrue(); //첫 번째 항목인지
        Assertions.assertThat(page.hasNext()).isTrue(); //다음 페이지가 있는지


    }
}
